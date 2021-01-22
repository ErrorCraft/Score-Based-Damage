# Score-Based-Damage

### [Download here](https://github.com/ErrorCraft/Score-Based-Damage/releases)

This is a data pack that allows you to damage and heal players based on a score! I want players to be able to modify player health more easily, because the instant_damage and instant_health effects are not useful at all. It modifies your maximum health using the attribute command, and so it keeps fractional health as well! For example, if your health was `19.877` and your score was set to `2`, your new health would be `17.877`!
Unfortunately, this method has a small downside. It ignores absorption, it only takes your actual current health and maximum health. I would have to add effect commands for every single level of absorption, combined with all possible time values (that would be a lot of commands.)
It is discouraged to run the function every tick, because it's not needed. You only have to call the function if you actually want to damage or heal the player, and that is usually right after you set the score.

## Example function
```mcfunction
# a function that is executed as the player (only once, for example as an advancement reward)
scoreboard players set @s custom_damage 3
function custom_damage:apply
```
