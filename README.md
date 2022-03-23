## **[Mason](https://pub.dev/packages/mason) Bricks for Flutter projects**

### **Purpose**:
Easily generate template files instead of copy-pasting them in every new project.

If you have not installed `mason` yet, [here](https://pub.dev/packages/mason_cli#installation) is how you can do it.

### **Usage**:

There are two ways of using bricks. There are local bricks, and global bricks. With global bricks you will not have to repeat the actions of initializing mason in new projects and adding bricks for every new project. [Here are the details](https://pub.dev/packages/mason_cli#add-usage).


1. init mason(**Needed only when you want to add some local bricks only for current project. If you want to use in your project only global bricks, skip this step**)
    - Open the `flutter` project, and create `mason` folder
    - Move to that folder in terminal(ex.: `cd mason`)
    - Run `mason init` command
    
    Globally `mason` will be automatically initiated in `/Users/your-name/.mason-cache/global` when you will add new global bricks. That's why you should skip this step, if you want to use global bricks.
</br>

2. Add reference to bricks(register) from this repository.</br>
    There are two options to do that:
    </br></br>
   1. Through command line(**recommended**):</br>
        Choose bricks, that you want to add:
        <div>
            <input type="checkbox" class="brick-checkbox" name="theme" checked>
            <label for="theme">theme</label>
        </div>
        <div>
            <input type="checkbox" class="brick-checkbox" name="crashlytics_helper" checked>
            <label for="theme">crashlytics_helper</label>
        </div>
        <div>
            <input type="checkbox" class="brick-checkbox" name="device_info_helper" checked>
            <label for="theme">device_info_helper</label>
        </div>
        </br>
        Choose whether add these bricks globally, or locally.

        ***Globally** means that you will **not** have to repeat this action of adding bricks for every new project. [More detailed](https://pub.dev/packages/mason_cli#add-usage)*.
        </br>
        <div>
            <input type="checkbox" name="global" checked>
            <label for="global">global</label>
        </div>
        </br>

        - Run the following code in terminal. **If you choosed the local way of adding bricks, then run the code in the `mason` folder(from step 1)**
        </br></br>
        <code id="add-code-block"></code>
        </br></br>
   2. Manually
       - Open file `<flutter-project>/mason/mason.yaml`(if you want to add bricks locally). For global bricks open `/Users/your-name/.mason-cache/global/mason.yaml`
       - Add references to the desired bricks
           ```yaml
           bricks:
             # Add code below 
             theme:
               git:
                 url: https://github.com/radomir9720/mason_bricks.git
                 path: theme
             crashlytics_helper:
               git:
                 url: https://github.com/radomir9720/mason_bricks.git
                 path: crashlytics_helper
             device_info_helper:
               git:
                 url: https://github.com/radomir9720/mason_bricks.git
                 path: device_info_helper
           ```
       - Run `mason get`

</br>

3. Generate bricks</br>
    Path where to paste generated code relative to current directory.

    <input type="text" id="path" name="path" required placeholder="Where to paste code" value="lib/" ></br>
    *For example if you are in root directory of your project(`<flutter-project>/`) and in the field above you've entered `lib/` path, then all brick files will be generated in `<flutter-project>/lib/` folder*

    </br></br>
    <code id="make-code-block"></code>
    </br></br>
   
   If you want to use local brick, then these commands must be executed from `<flutter-project>/mason` folder.

</br>

if you've created some local bricks, don't forget to exclude `mason` folder in `analysis_options.yaml`:

```yaml
analyzer:
  exclude:
    - mason/**
```

<script>
	let bricks = document.querySelectorAll('.brick-checkbox');
	let addCommandCodeBlock = document.getElementById('add-code-block');
	let makeCommandCodeBlock = document.getElementById('make-code-block');
	let globalCheckbox = document.querySelector('input[name=global]');
	let field = document.getElementById('path');

	changeCodeContent();


	// Adding event listeners to brick checkboxes
	if (bricks != null) {
		bricks.forEach(function (brick) {
			brick.addEventListener('change', () => changeCodeContent());
		})
	}

	// Adding event listener to global checkbox
	globalCheckbox.addEventListener('change', () => changeCodeContent());

	// Adding event listener to path input field
	field.onchange = changeCodeContent;

	function changeCodeContent() {
		var selectedBricks = getSelectedBricks();
		// 
		var addCommands = generateAddCommand(selectedBricks, globalCheckbox.checked)
		addCommandCodeBlock.textContent = addCommands;
		// 
		var makeCommands = generateMakeCommand(selectedBricks, field.value);
		makeCommandCodeBlock.textContent = makeCommands;
	}

	function getSelectedBricks() {
		if (bricks == null) return [];
		return [...bricks].filter((e) => e.checked).map((e) => e.name);
	}

	function generateAddCommand(bricks, global) {
		return bricks.map((e) => getAddCommand(e, global)).join(' && ');
	}


	function getAddCommand(brick, global) {
		return `mason add ${brick}${global ? ' -g' : ''} --git-url https://github.com/radomir9720/mason_bricks.git --git-path ${brick}`;
	}

	function generateMakeCommand(bricks, path) {
		return bricks.map((e) => getMakeCommand(e, path)).join(' && ');
	}

	function getMakeCommand(brick, path) {
		return `mason make ${brick} -o ${path ?? '.'}`;
	}
</script>