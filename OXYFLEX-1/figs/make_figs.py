"""
Slide versions of two OxyFlex figures.

The repository versions (`results/figs/`) carry their own titles and are sized
for a report. These are the same data, redrawn for a projector: no title (the
slide carries it), fewer words, larger type.

Sources, both read straight from the oxyflex checkout:
  results/label_overview/term_provenance.tsv   (data_explore/data_label_figures.py)
  results/anaerobe_only/pca_scores.tsv         (analyses/05_anaerobe_only_pca.py)

Run:  ~/.conda/envs/oxyflex/bin/python figs/make_figs.py
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

OXYFLEX = Path.home() / "gh" / "m3i" / "oxyflex"
OUT = Path(__file__).resolve().parent

plt.rcParams.update({
    "svg.fonttype": "none",          # keep text as text, so Typst can scale it
    "font.size": 12,
    "axes.spines.top": False,
    "axes.spines.right": False,
})

OBSERVED = "#2b6cb0"
PREDICTED = "#dd8b2c"
GREY = "#9e9e9e"
FACULTATIVE = "#e08a2c"


def term_provenance():
    """Who wrote each BacDive oxygen term: a curator, or a genome model?"""
    df = pd.read_csv(OXYFLEX / "results/label_overview/term_provenance.tsv", sep="\t")
    df = df.sort_values("observed", ascending=True)

    fig, ax = plt.subplots(figsize=(9.2, 3.4))
    y = np.arange(len(df))

    ax.barh(y, -df["observed"], height=0.72, color=OBSERVED,
            label="observed — a curator, a collection or a species description")
    ax.barh(y, df["predicted"], height=0.72, color=PREDICTED,
            label="predicted by a genome model, stored in BacDive")

    for i, row in enumerate(df.itertuples()):
        ax.text(-row.observed - 90, i, f"{row.observed:,}",
                ha="right", va="center", fontsize=10)
        if row.predicted:
            ax.text(row.predicted + 90, i,
                    f"{row.predicted:,}  ({row.share_predicted:.0%} of the term)",
                    ha="left", va="center", fontsize=10, color="#555555")

    ax.axvline(0, color="black", linewidth=0.8)
    ax.set_yticks(y, df["term"])
    ax.set_xlim(-6100, 6100)
    ax.set_xticks([-5000, -2500, 0, 2500, 5000], ["5,000", "2,500", "0", "2,500", "5,000"])
    ax.set_xlabel("Genomes whose BacDive record carries the term (of 8,658)")
    ax.spines["left"].set_visible(False)
    ax.tick_params(axis="y", length=0)
    ax.legend(bbox_to_anchor=(0.0, 1.0), loc="lower left", ncol=1,
              frameon=False, fontsize=10)

    fig.tight_layout()
    fig.savefig(OUT / "term_provenance.svg")
    plt.close(fig)
    print("wrote term_provenance.svg")


def anaerobe_only():
    """Where the 'anaerobe'-only genomes fall along the anaerobe/facultative axis."""
    df = pd.read_csv(OXYFLEX / "results/anaerobe_only/pca_scores.tsv", sep="\t")
    by = {g: d["axis_score"] for g, d in df.groupby("group")}

    fac = by["reference facultative"]
    cutoff = np.quantile(fac, 0.95)          # at most 5% of known facultatives above
    only = by["'anaerobe' only"]
    share = (only > cutoff).mean()

    fig, ax = plt.subplots(figsize=(9.2, 3.3))
    bins = np.linspace(df["axis_score"].min(), df["axis_score"].max(), 60)

    for name, colour, label in [
        ("reference aerobe", GREY, "known aerobes"),
        ("reference facultative", FACULTATIVE, "known facultatives"),
        ("reference anaerobe", OBSERVED, "known obligate anaerobes"),
    ]:
        ax.hist(by[name], bins=bins, density=True, alpha=0.55, color=colour,
                label=f"{label} ({len(by[name]):,})")
    ax.hist(only, bins=bins, density=True, histtype="step", color="black", linewidth=1.6,
            label=f"BacDive says only “anaerobe” ({len(only):,})")

    ax.axvline(cutoff, color="black", linestyle="--", linewidth=1)
    ax.set_ylim(top=ax.get_ylim()[1] * 1.25)          # headroom for the annotation
    ax.annotate(f"{share:.0%} of them land on this side",
                xy=(cutoff + 0.1, ax.get_ylim()[1] * 0.98), fontsize=11, va="top")

    ax.set_xlabel("Gene-content axis that separates obligate anaerobes from facultatives"
                  "  (PC4, AUC 0.98)")
    ax.set_ylabel("Density")
    ax.set_yticks([])
    ax.legend(loc="upper left", frameon=False, fontsize=10)

    fig.tight_layout()
    fig.savefig(OUT / "anaerobe_only.svg")
    plt.close(fig)
    print(f"wrote anaerobe_only.svg  (cutoff {cutoff:.2f}, {share:.1%} above)")


if __name__ == "__main__":
    term_provenance()
    anaerobe_only()
