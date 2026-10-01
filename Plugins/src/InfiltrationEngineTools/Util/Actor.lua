local ActorUtil = script.Parent.ActorUtil
return {
  Create = require(ActorUtil._ActorCreation._Create),

	State = require(ActorUtil._ActorState._State),
	Derived = require(ActorUtil._ActorState._Derived),
	DerivedTable = require(ActorUtil._ActorState._DerivedTable),
	Watch = require(ActorUtil._ActorState._Watch),

	Spring = require(ActorUtil._ActorAnim._ActorSpring),
	Cubic = require(ActorUtil._ActorAnim._Cubic),

	OnChange = require(ActorUtil._OnChange),
}
