# Score-Based Damage

Because [MC-19690](https://bugs.mojang.com/browse/MC-19690) was fixed, I was able to use a different method of applying damage without getting the fake death. This means that the bug that instantly killed you if you took damage from a different source after you applied damage is no longer present in the data pack as of version `1.4.0`.

### [Download here](https://github.com/ErrorCraft/Score-Based-Damage/releases)

This is a data pack that allows you to damage and heal players based on a score! I want players to be able to modify player health more easily, because the `instant_damage` and `instant_health` effects are not useful at all. It modifies your maximum health using the `attribute` command, and so it keeps fractional health as well! For example, if your health was `19.877` and your score was set to `2`, your new health would be `17.877`!

Unfortunately, this method has a small downside. It ignores absorption, it only takes your actual current health and maximum health. I would have to add `effect` commands for every single level of absorption, combined with all possible time values (that would be a lot of commands.) It is discouraged to run the function every tick, because it's not needed. You only have to call the function if you actually want to damage or heal the player, and that is usually right after you set the score.

If the player is supposed to die, it will call the `#custom_damage:death` function tag, instead of applying the damage. This way you can add your own death functions.

## Example function
```mcfunction
# A function that is executed as the player (only once, for example as an advancement reward)
scoreboard players set @s custom_damage 3
function custom_damage:apply
```
