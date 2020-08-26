# Exploding Chest
Exploding Chest API mod   
Provides a framework to make a volatile chest or storage nodes which explode if it contains any registered explosive materials.

## Installation
- Unzip the archive, rename the folder to `explodingchest` and
place it in .. minetest/mods/

- GNU/Linux: If you use a system-wide installation place
    it in ~/.minetest/mods/.

- If you only want this to be used in a single world, place
    the folder in .. worldmods/ in your world directory.

For further information or help, see:   
https://wiki.minetest.net/Installing_Mods

## Make chest volatile

By setting the chest's group to volatile it will be able to explode, Also it can be made into a trap chest.

Example:

```lua
groups = {volatile = 1}
```

## Setting explosive materials

On any node or item that is to be explosive, set its group to explosive = [insert number]. The number is the radius of the explosion.


Example:

``` lua
groups = {explosive = 3}
```

## Trap chest

To make a trap chest place the explodingchest:trap craftitem into any volatile chest. If the chest contains any explosive materials it will blow up on right click.

`explodingchest:trap` has no crafting receipt. You have to give it one.

## Settings

To limit the size of the explosion.

```lua
explodingchest.explosion_max = 11
```

The way the explosion is calculated.   
Multiply means explosive material is multiplied.   
Reduce means the initial explosion size is set to the biggest explosive material then the rest is dividend by reduce.

```lua
explodingchest.radius_comput = "reduce"
```

The amount to divide by. (this is only in use if radius_comput is set to reduce)

```lua
explodingchest.reduce = 288
```

If true the chest from default will be made into a volatile container, and also a few other items will be overrided.

```lua
explodingchest.override_default = true
```

These settings can be changed in advanced settings.

## Blast Type

Instant blast type means the volatile container will blow up in 0 seconds.   
Entity blast type means the volatile container will turn into a entity (You need `tnt_revamped` mod turn on for this).   
Timer blast type means the volatile container will have a delay before blowing up.   

```lua
explodingchest.blast_type = "instant"
```

This setting is for when the volatile container is opened and theres a trap craftitem inside.     
Instant blast type means the volatile container will blow up in 0 seconds.     
Entity blast type means the volatile container will turn into a entity (You need `tnt_revamped` mod turn on for this).    
Timer blast type means the volatile container will have a delay before blowing up.   

```lua
explodingchest.trap_blast_type = "instant"
```

Blast delay timer (only works for entity and timer).    
If timer is set to zero then the timer is auto set to the blast radius size.

``` lua
explodingchest.timer = 0
```