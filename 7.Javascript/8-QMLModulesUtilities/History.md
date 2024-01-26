# Shows how to make a bunch of js files part of a QML module and expose for use in other QML files	
	. Change to follow the structure in 4.CustomComponents/ 3. QML-Modules

# Changes

- Builds on [History.md](../8-QMLModules/History.md) and [History.md](../9-QMLModulesProperties/History.md)
  
## [CMakeLists.txt](CMakeLists.txt)

- Adds another component [```MyUtilities```](utilities/)
  - Demonstrates how to create and reuse utility methods in js as modules
- Imports and re-uses teh module in [Main.qml](Main.qml)