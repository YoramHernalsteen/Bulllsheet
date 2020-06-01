let rowIndexCrewNewCallsheet = 1;
let rowIndexCastNewCallsheet = 1;
let rowIndexLocationNewCallsheet = 1;
let rowIndexPlanningNewCallsheet = 1;
let rowIndexMaterialsNewCallsheet = 1;
let rowIndexCrewEditCallsheet = 1;
let rowIndexCastEditCallsheet = 1;
let rowIndexMaterialsEditCallsheet = 1;
let rowIndexLocationEditCallsheet = 1;
let rowIndexPlanningEditCallsheet = 1;

//MAIN FUNCTIONS
//Add cast and crew
let addRowCrewNewCallsheet = function () {
    let listName = 'crew';
    castCrewRowMaker(listName, rowIndexCrewNewCallsheet, "castCrewNewCallsheet");
    rowIndexCrewNewCallsheet++;
};

let addRowCastNewCallsheet = function () {
    let listName = 'cast';
    castCrewRowMaker(listName, rowIndexCastNewCallsheet, "castCrewNewCallsheet");
    rowIndexCastNewCallsheet++;
};

let addRowCrewEditCallsheet = function () {
    let listName = 'crewJS';
    castCrewRowMaker(listName, rowIndexCrewEditCallsheet, "");
    rowIndexCrewEditCallsheet++;
}
let addRowCastEditCallsheet = function () {
    let listName = 'castJS';
    castCrewRowMaker(listName, rowIndexCastEditCallsheet, "");
    rowIndexCastEditCallsheet++;
}

//add materials
let addRowMaterialsNewCallsheet = function () {
    let listName = 'material';
    addRowMaterials(listName, rowIndexMaterialsNewCallsheet);
    rowIndexMaterialsNewCallsheet++;
}
let addRowMaterialsEditCallsheet = function () {
    let listName = 'materialsJS';
    addRowMaterials(listName, rowIndexMaterialsEditCallsheet);
    rowIndexMaterialsEditCallsheet++;
}

// add locations
let addRowLocationsNewCallsheet = function () {
    let listName = 'extraLocation';
    addRowLocation(listName, rowIndexLocationNewCallsheet, 'Type');
    rowIndexLocationNewCallsheet++;
}
let addRowLocationsEditCallsheet = function () {
    let listName = 'locationJS';
    addRowLocation(listName, rowIndexLocationEditCallsheet, 'Name');
    rowIndexLocationEditCallsheet++;
}
// add planning
let newRowPlanningEditCallsheet = function () {
    let listName = 'planningJS';
    let fieldsNames = ['Begin', 'End', 'Location', 'Description', 'Button']; //field names from cast
    let row = document.createElement('tr');
    row.classList.add('row');
    fieldsNames.forEach((fieldName) => {
        let col = document.createElement('td');
        if (fieldName === 'Begin' || fieldName === 'End') {
            col.classList.add('col');
        } else if (fieldName === 'Description') {
            col.classList.add('col-5')
        } else if (fieldName === 'Button') {
            col.classList.add('col-1')
        } else {
            col.classList.add('col-3');
        }
        let input;
        if (fieldName !== 'Button') {
            input = document.createElement('input');
            if (fieldName === 'Begin' || fieldName === 'End') {
                input.type = 'time';
            } else {
                input.type = 'text';
            }
            if (fieldName === 'Description') {
                input.classList.add('form-control', 'w-100', 'pb-5', 'mb-5');
            } else {
                input.classList.add('form-control', 'w-100');
            }
        } else {
            input = document.createElement('button');
            input.classList.add('deleteRow', 'float-right');
            let text = document.createElement('i');
            text.classList.add('fas', 'fa-trash-alt', 'fa-2x', 'iconDel');
            input.appendChild(text);
        }
        input.id = listName + fieldName;
        input.setAttribute('name', listName + 'Row' + rowIndexPlanningEditCallsheet);
        col.appendChild(input);
        row.appendChild(col);
    });
    document.getElementById('planningJS').appendChild(row);
    rowIndexPlanningEditCallsheet++;
};
let addRowPlanningNewCallsheet = function () {
    let listName = 'planning';
    let fieldsNames = ['Begin', 'End', 'Description', 'Button']; //field names from cast
    let row = document.createElement('tr');
    row.classList.add('row');
    fieldsNames.forEach((fieldName) => {
        let col = document.createElement('td');
        if (fieldName === 'Begin' || fieldName === 'End') {
            col.classList.add('col-2');
        } else if (fieldName === 'Description') {
            col.classList.add('col-7')
        } else if (fieldName === 'Button') {
            col.classList.add('col-1')
        }
        let input;
        if (fieldName !== 'Button') {
            input = document.createElement('input');
            if (fieldName === 'Begin' || fieldName === 'End') {
                input.type = 'time';
            } else {
                input.type = 'text';
            }
            if (fieldName === 'Description') {
                input.classList.add('form-control', 'w-100', 'pb-5', 'mb-5');
            } else {
                input.classList.add('form-control', 'w-100');
            }
        } else {
            input = document.createElement('button');
            input.classList.add('deleteRow', 'float-right');
            let text = document.createElement('i');
            text.classList.add('fas', 'fa-trash-alt', 'fa-2x', 'iconDel');
            input.appendChild(text);
            input.classList.add("planningNewCallsheet");
            input.setAttribute("onclick", "buttonPlanningNewCallsheet()");
            let buttons = document.getElementsByClassName("planningNewCallsheet");
            for (let i = 0; i < buttons.length; i++) {
                buttons[i].removeAttribute("disabled");
            }
            input.appendChild(text);
        }
        input.setAttribute('name', listName + 'Row' + rowIndexPlanningNewCallsheet);
        col.appendChild(input);
        row.appendChild(col);
    });
    document.getElementById(listName).appendChild(row);
    rowIndexPlanningNewCallsheet++;
};

//HELPER FUNCTIONS
let castCrewRowMaker = function (listName, rowIndex, extraClass) {
    let fieldsNames = ['Function', 'Name', 'Phone', 'Mail', 'Call', 'Button'];
    let row = document.createElement('tr');
    row.classList.add('row');
    fieldsNames.forEach((fieldName) => {
        let col = document.createElement('td');
        if (fieldName === 'Mail' || fieldName === 'Name') {
            col.classList.add('col-3');
        } else if (fieldName === 'Button') {
            col.classList.add('col-1')
        } else if (fieldName === 'Phone' || fieldName === 'Call') {
            col.classList.add('col')
        } else {
            col.classList.add('col-2');
        }
        let input;
        if (fieldName !== 'Button') {
            input = document.createElement('input');
            if (fieldName === 'Mail') {
                input.type = 'email'
            } else if (fieldName === 'Call') {
                input.type = 'time'
            } else {
                input.type = 'text';
            }
            input.classList.add('w-100', 'form-control');
        } else {
            input = document.createElement('button');
            input.classList.add('deleteRow', 'float-right');
            if (extraClass === "castCrewNewCallsheet") {
                input.classList.add(extraClass);
                input.setAttribute("onclick", "buttonCastCrewNewCallsheet()");
                let buttons = document.getElementsByClassName(extraClass);
                for (let i = 0; i < buttons.length; i++) {
                    buttons[i].removeAttribute("disabled");
                }
            }
            let text = document.createElement('i');
            text.classList.add('fas', 'fa-trash-alt', 'fa-2x', 'iconDel');
            input.appendChild(text);
        }
        input.setAttribute('name', listName + 'Row' + rowIndex);
        col.appendChild(input);
        row.appendChild(col);
    });
    document.getElementById(listName).appendChild(row);
};

let addRowLocation = function (listName, index, nameOrType) {
    let fieldsNames = ['Name', 'Adress', 'Zip', 'City', 'Type', 'Button', 'Description']; //field names from cast
    let row = document.createElement('tr');
    row.classList.add('row');
    fieldsNames.forEach((fieldName) => {
        let col = document.createElement('td');
        if (fieldName === 'Zip' || fieldName === 'Button') {
            col.classList.add('col-1');
        } else if (fieldName === 'Adress' || fieldName === nameOrType) {
            col.classList.add('col-3');
        } else if (fieldName === 'Description') {
            col.classList.add('col-12')
        } else {
            col.classList.add('form-group', 'col-2');
        }
        let input;
        if (fieldName !== 'Button') {
            input = document.createElement('input');
            input.type = 'text';
            input.classList.add('form-control', 'w-100');
        } else {
            input = document.createElement('button');
            input.classList.add('deleteRow', 'float-right');
            let text = document.createElement('i');
            text.classList.add('fas', 'fa-trash-alt', 'fa-2x', 'iconDel');
            input.appendChild(text);
        }
        input.id = listName + fieldName;
        input.setAttribute('name', listName + 'Row' + index);
        col.appendChild(input);
        row.appendChild(col);
    });
    document.getElementById(listName).appendChild(row);
    rowIndexLocationNewCallsheet++;
};


let addRowMaterials = function (listName, index) {
    let fieldsNames = ['Type', 'Name', 'Specifications', 'Button']; //field names from material
    let row = document.createElement('tr');
    row.classList.add('row');

    fieldsNames.forEach((fieldName) => {
        let col = document.createElement('td');
        if (fieldName === 'Specifications') {
            col.classList.add('col-7');
        } else if (fieldName === 'Button') {
            col.classList.add('col-1');
        } else {
            col.classList.add('col-2');
        }
        let input;
        if (fieldName !== 'Button') {
            input = document.createElement('input');
            input.type = 'text';
            input.classList.add('form-control', 'w-100');
        } else {
            input = document.createElement('button');
            input.classList.add('deleteRow', 'float-right');
            let text = document.createElement('i');
            text.classList.add('fas', 'fa-trash-alt', 'fa-2x', 'iconDel');
            input.appendChild(text);
        }
        input.id = listName + fieldName;
        input.setAttribute('name', listName + 'Row' + index);
        col.appendChild(input);
        row.appendChild(col);
    });
    document.getElementById(listName).appendChild(row);
};

// ADD DELAY IN CALLSHEET
const extraTime = function (timeAmount) {
    let timeValue = document.querySelector("#delayTime").value;
    console.log(timeValue);
    if (timeValue === '') timeValue = '00:00';
    let hour = 0;
    let minute = 0;
    let splitTime = timeValue.split(':');

    hour = parseInt(splitTime[0]);
    minute = parseInt(splitTime[1]) + timeAmount;
    hour = hour + Math.floor(minute / 60);
    minute = minute % 60;
    if (minute < 10) minute = '0' + minute;
    if (hour < 10) hour = '0' + hour;
    if (hour >= 5) document.querySelector("#delayTime").value = '05:00:00';
    else document.querySelector("#delayTime").value = hour + ':' + minute + ':00';
};

// DISABLE REMOVE BUTTONS IF LESS THAN 1 ROW IN NEW-CALLSHEET
let buttonCastCrewNewCallsheet = function () {
    let classNameButtons = "castCrewNewCallsheet";
    let amountOfRows = document.getElementById("cast").rows.length;
    amountOfRows += document.getElementById("crew").rows.length;
    disableRemoveButton(classNameButtons, amountOfRows);
};

let buttonPlanningNewCallsheet = function () {
    let classNameButtons = "planningNewCallsheet";
    let amountOfRows = document.getElementById("planning").rows.length;
    disableRemoveButton(classNameButtons, amountOfRows);
};

let disableRemoveButton = function (className, amountOfRows) {
    let buttons = document.getElementsByClassName(className);
    if (amountOfRows <= 1) {
        for (let i = 0; i < buttons.length; i++) {
            buttons[i].setAttribute("disabled", "true");
        }
    }
};

//DATE CHECK FOR DUPLICATE DATE CALLSHEETS
const dateDuplicateCheck = function () {
    let test = document.getElementById("callsheetDate").value;
    let dateArray = document.getElementById("futureSheets").children;
    for (let i = 0; i < dateArray.length; i++) {
        let listDate = dateArray.item(i).getAttributeNode("value").value;
        if (listDate === test) return false;
    }
    return true;
};

const datePoppers = function () {
    datePopup.style = "visibility:hidden";
    if (!dateDuplicateCheck()) datePopup.style = "visibility:visible";
};

const dateSubmissionCheck = function () {
    if (!dateDuplicateCheck()) {
        alert("Callsheet was not created due to same date error!");
        return false;
    }
    return true;
};


const usernameCheck = function (newName) {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                namePopup.style = "visibility:hidden";
                if (newName === usernameOriginal.innerText) {
                    username.style = "border-color: #ced4da"; // OG color
                } else {
                    if (xhr.responseText === 'false') {
                        username.style = "border-color: #d90e1d"; //red
                        namePopup.style = "visibility:visible";
                    } else if (xhr.responseText === 'empty') username.style = "border-color: #d90e1d";
                    else username.style = "border-color: #28a745"; //green
                }
            }
        }
    };
    xhr.open('GET', '/examples/echo?newUsername=' + newName, true);
    xhr.send(null);
};


const passwordCheck = function () {
    let xhr = new XMLHttpRequest();
    let pass = document.getElementById("passTest");

    xhr.onreadystatechange = function () {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                if (xhr.responseText === 'true') {
                    $("#myModal").modal();
                    passTest.value = "";
                } else {
                    incorrectPasswordPopup.style = "visibility:visible";
                }
            }
        }
    };
    xhr.open('GET', '/passwordchange/request?passCheck=' + pass.value, true);
    xhr.send(null);
};

const passequal = function () {
    let pass1 = document.getElementById("newPassword");
    let pass2 = document.getElementById("confirmNewPassword");
    if (pass1.value === pass2.value && pass1.value.length > 5) return true;
    else {
        if (pass1.value !== pass2.value) passNotEqualPopup.style = "visibility:visible";
        if (pass1.value.length < 5 || pass2.value.length < 5) passEmptyPopup.style = "visibility:visible";
        return false;
    }
};

const clearPopup = function () {
    passEmptyPopup.style = "visibility:hidden";
    passNotEqualPopup.style = "visibility:hidden";
};

(function () {
    'use strict';
    window.addEventListener('load', function () {
        var forms = document.getElementsByClassName('needs-validation');
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();