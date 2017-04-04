package sorcery.framework.physics;

/**
 * @author Dmitriy Kolesnik
 */
typedef Spatial2DComponent = 
#if flash
sorcery.framework.physics.flash.Spatial2DComponent;
#elseif cs
sorcery.framework.physics.unity.Spatial2DComponent; 
#end

