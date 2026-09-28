# Faster Knives Recovery

A Cyberpunk 2077 mod that shortens thrown knife and Agaou recovery toward roughly 0.5 seconds while leaving damage and weapon bonuses untouched. It also sets knife and axe projectile start velocity to 220.

## Install

Copy the `r6` directory into the Cyberpunk 2077 game directory. The game should then contain:

- `r6/tweaks/FasterKnives_RecoveryOnly.yaml`
- `r6/scripts/FasterKnives_RecoveryOnly.reds`

Requires RED4ext, TweakXL, and redscript. Mod Settings is optional. Disable `CurrentFasterKnives` and the two source mods before installing this combined mod so their recovery multipliers do not stack.

## Settings

The TweakXL file provides default recovery multipliers. With Mod Settings installed, open **Settings → Mod Settings → Faster Knives Recovery** to adjust each knife group in game. Smaller multipliers mean faster recovery. Re-equip the weapon after changing a value. Without Mod Settings, the defaults in the YAML file remain active.

The defaults were tuned against one character's observed Tier 5 recovery times. Actual recovery depends on weapon tier, perks, and other installed mods. No damage modifier is changed.

## Source

The installable mod source is the YAML and REDscript in `r6`. No build step is required. This repository excludes game files, saves, logs, and earlier release ZIPs.

Weapon coverage was based on `CurrentFasterKnives`. This mod was also informed by **Faster Throwing Knife Recovery and Projectile Velocity** by orton4 and **Faster Agaou And Bleu Fang** by S7venCrow. Their original files are not included here.
