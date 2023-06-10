// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import FilterController from "./filter_controller"
application.register("filter", FilterController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import ProfiledropdownController from "./profiledropdown_controller"
application.register("profiledropdown", ProfiledropdownController)

import SupersearchbarController from "./supersearchbar_controller"
application.register("supersearchbar", SupersearchbarController)

import VisibilityController from "./visibility_controller"
application.register("visibility", VisibilityController)
