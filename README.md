# explodingchest
explodingchest-api mod

This mod provides a framework to make a volatile chest or storage nodes which explode if it contains any registered explosive materials.

# Make chest volatile

By setting the chest's group to volatile it will be able to explode, Also it can be made into a trap chest.

Example:

``` lua
groups = {volatile = 1}
```

# Setting explosive materials

On any node or item that is to be explosive, set its group to explosive = [insert number]. The number is the radius of the explosion.


Example:

``` lua
groups = {explosive = 3}
```

# Trap chest

To make a trap chest place the explodingchest:trap craftitem into any volatile chest. If the chest contains any explosive materials it will blow up on right click.

explodingchest:trap Has no crafting receipt. You have to give it one.

# Settings

To limit the size of the explosion.

explodingchest.explosion_max

The way the explosion is calculated.

Multiply means explosive material is multiplied.

Reduce means the initial explosion size is set to the biggest explosive material then the rest is dividend by reduce.

explodingchest.radius_comput

The amount to divide by. (this is only in use if radius_comput is set to reduce)

explodingchest.reduce

These settings can be changed in advanced settings.

# Blast Type

Instant blast type means the volatile container will blow up in 0 seconds.

Entity blast type means the volatile container will turn into a entity (You need tnt_revamped mod turn on for this)

Timer blast type means the volatile container will have a delay before blowing up.

explodingchest.blast_type

This setting is for when the volatile container is opened and theres a trap craftitem inside.

Instant blast type means the volatile container will blow up in 0 seconds.

Entity blast type means the volatile container will turn into a entity (You need tnt_revamped mod turn on for this)

Timer blast type means the volatile container will have a delay before blowing up.

explodingchest.trap_blast_type

Blast delay timer (only works for entity and timer)

If timer is set to zero then the timer is auto set to the blast radius size.

explodingchest.timer
