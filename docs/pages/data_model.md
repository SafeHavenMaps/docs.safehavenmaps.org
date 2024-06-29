# Understanding the data model

## Overview

The datamodel is composed of the following classes of objects:

```mermaid
graph TD
    FamA[Family A] --> C1[Category A]
    FamA --> C2[Category B]
    C1 --> E1[Entity 1]
    C1 --> E2[Entity 2]
    C2 --> E3[Entity 3]
    C2 --> E4[Entity 4]

    E1 --> T1[Tag 1]
    E2 --> T1
    E3 --> T1

    E4 --> T2[Tag 2]
```

### Families

A family is defining the data model for all entities that are part of it:
- The entity form defines the fields that are available for the entities of the family.
- The comment form defines the fields that are available for the comments of the entities of the family.

Each family can have multiple categories.

They are displayed on the top of the map and is used to switch the context of the map itself:

![Family](../_media/screens/families.png)

On this screenshot we have 3 families: `Health`, `Others` and `Legal`.

### Categories

A category is a way to group entities together. Categories are responsible for theming the entities on the map.
Each category can have multiple entities, but an entity can only belong to one category.

### Entities

They are the points on the map. They have a dynamic data column which is defined by the family they belong to.

Entities can have parent entities. When an entity has a parent, it will be displayed as a child of the parent entity on the map.

### Comments

Comments are attached to entities. They have a dynamic data column which is defined by the family to which the entity they belong to belongs to.

### Tags

Tags are attached to entities. They are primarily used to filter efficiently the entities on the map.
They are shared between all entities, regardless of the family they belong to.

Some of them can be noted as "filtering" so they take a special place in the filter panel.
