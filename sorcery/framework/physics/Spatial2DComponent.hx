package sorcery.framework.physics;

/**
 * @author Dmitriy Kolesnik
 */
typedef Spatial2DComponent = 
#if flash
sorcery.framework.physics.FlashSpatial2DComponent;
#elseif cs
sorcery.framework.physics.UnitySpatial2DComponent; 
#end

