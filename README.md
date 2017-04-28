# Helper
Useful Helper functions

## Make
A shortcut function for creating instances
```lua
Make("TextLabel"){
	TextSize = 11;
	Font = "Arial";
	Name = "Yup";
	Parent = workspace;
}
```
You can also create multiple instances at once. When you pass subsequent tables as parameters, the object created by the first table is Cloned and modified by the properties in its table. Each subsequent table generates a new instance.

```lua
Make("TextLabel")({
	TextSize = 11;
	Font = "Arial";
	Name = "Yup";
	Parent = workspace;
}, {
	Name = "So!";
	Font = "SourceSans";
}, {
	Name = "Yellow!";
})
```
