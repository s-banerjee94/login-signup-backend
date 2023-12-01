var dropElement = document.getElementsByClassName('control-fluid')[0];
// Initialize the control with file validation
var uploadObj = new ej.inputs.Uploader({
  autoUpload: true,
  minFileSize: 10000,
  allowedExtensions: '.png, .jpg, .gif, .jpeg',
  asyncSettings: {
    saveUrl: 'https://ej2.syncfusion.com/services/api/uploadbox/Save',
    removeUrl: 'https://ej2.syncfusion.com/services/api/uploadbox/Remove',
  },
  sequentialUpload: true,
  selected: onFileSelected,
  success: onUploadSuccess,
  dropArea: dropElement,
});
uploadObj.appendTo('#validation');
let numberOfSeletedFile = 0;
function onFileSelected(args) {
  // Filter the 5 files only to showcase
  args.filesData.splice(5);
  var filesData = uploadObj.getFilesData();
  var allFiles = filesData.concat(args.filesData);
  if (allFiles.length > 5) {
    for (var i = 0; i < allFiles.length; i++) {
      if (allFiles.length > 5) {
        allFiles.shift();
      }
    }
    args.filesData = allFiles;

    // set the modified custom data
    args.modifiedFilesData = args.filesData;
  }
  numberOfSeletedFile = allFiles.length;
  args.isModified = true;
}
let closeAddItemDialog = 0;
let imageNameMapUrl = new Map();
function onUploadSuccess(args) {
  var _this = this;
  var li = this.uploadWrapper.querySelector(
    '[data-file-name="' + args.file.name + '"]'
  );
  console.log(args.operation);
  if (args.operation == 'upload') {
    imageNameMapUrl.set(
      args.file.name,
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s'
    );
  } else if (args.operation == 'remove') {
    if (imageNameMapUrl.has(args.file.name))
      imageNameMapUrl.delete(args.file.name);
  }
  closeAddItemDialog++;
  console.log(closeAddItemDialog + ' ' + numberOfSeletedFile);
  if (numberOfSeletedFile == closeAddItemDialog) {
    dlgButtonClick();
    closeAddItemDialog = 0;
    uploadObj.selected;
  }

  if (args.operation === 'upload') {
    li.querySelector('.e-file-delete-btn').onclick = function () {
      generateSpinner(_this.uploadWrapper);
    };
    li.querySelector('.e-file-delete-btn').onkeydown = function (e) {
      if (e.keyCode === 13) {
        generateSpinner(e.target.closest('.e-upload'));
      }
    };
  } else {
    ej.popups.hideSpinner(this.uploadWrapper);
    ej.base.detach(this.uploadWrapper.querySelector('.e-spinner-pane'));
  }
}
function generateSpinner(targetElement) {
  ej.popups.createSpinner({ target: targetElement, width: '25px' });
  ej.popups.showSpinner(targetElement);
}
var ascClass = 'e-sort-icon-ascending';
var desClass = 'e-sort-icon-descending';

//define the array of JSON
var fruitsdata = [
  {
    text: 'Date',
    id: '1',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Fig',
    id: '2',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Apple',
    id: '3',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Apricot',
    id: '4',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Grape',
    id: '5',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Strawberry',
    id: '6',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Pineapple',
    id: '7',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Melon',
    id: '8',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Lemon',
    id: '9',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
  {
    text: 'Cherry',
    id: '10',
    imgUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0GFRorGpwleiXI0jOeGV8aKlRhKxCnCThsKShkZbtkw&s',
  },
];

//Initialize ListView component
var listViewInstance = new ej.lists.ListView({
  //set the data to datasource property
  dataSource: fruitsdata.slice(),

  //set the template for list items
  template:
    '<div class="fruits"><div class="first"><img id="listImage" src="${imgUrl}" alt="fruit" /><button class="delete e-control e-btn e-small e-round e-delete-btn e-primary e-icon-btn" data-ripple="true"><span class="e-btn-icon e-icons delete-icon"></span></button></div><div class="fruitName">${text}</div></div>',

  //set sortOrder for list items
  sortOrder: 'Ascending',
  actionComplete: function () {
    wireEvents();
  },
});

//Render initialized ListView
listViewInstance.appendTo('#element');

var dialogObj = new ej.popups.Dialog({
  header: 'Add Image',
  content: '<input type="file" id="validation" name="UploadFiles">',
  showCloseIcon: true,
  // buttons: [
  //   {
  //     click: dlgButtonClick,
  //     buttonModel: { content: 'Add', isPrimary: true },
  //   },
  // ],
  width: '500px',
  height: '300px',
  visible: false,
});

dialogObj.appendTo('#dialog');

function addItem() {
  dialogObj.show();
  uploadObj.appendTo('#validation');
}

function wireEvents() {
  Array.prototype.forEach.call(
    document.getElementsByClassName('e-delete-btn'),
    function (ele) {
      ele.addEventListener('click', onDeleteBtnClick);
    }
  );
  document.getElementById('add').addEventListener('click', addItem);
}

//Here we are removing list item
function onDeleteBtnClick(e) {
  e.stopPropagation();
  var li = ej.base.closest(e.currentTarget, '.e-list-item');
  var data = listViewInstance.findItem(li);
  listViewInstance.removeItem(data);
  new ej.data.DataManager(fruitsdata).remove('id', { id: data['id'] });
  console.log(listViewInstance.dataSource);
}

//Here we are adding list item
function dlgButtonClick() {
  //TODO add the uploaded images url

  imageNameMapUrl.forEach(getMapedValues);
  dialogObj.hide();
}

function getMapedValues(value, key, map) {
  var id = Math.random() * 10000;
  listViewInstance.addItem([{ text: key, id: id, imgUrl: value }]);
  fruitsdata.push({ text: key, id: id, imgUrl: value });
  listViewInstance
    .getLiFromObjOrElement({ id: id })
    .getElementsByClassName('e-delete-btn')[0]
    .addEventListener('click', onDeleteBtnClick);
}

//Here we are sorting list item
// function sortItems() {
//   var ele = document.getElementById('sort').firstElementChild;
//   var des = ele.classList.contains(desClass) ? true : false;
//   if (des) {
//     ele.classList.remove(desClass);
//     ele.classList.add(ascClass);
//     listViewInstance.sortOrder = 'Ascending';
//   } else {
//     ele.classList.remove(ascClass);
//     ele.classList.add(desClass);
//     listViewInstance.sortOrder = 'Descending';
//   }
//   listViewInstance.dataBind();
//   wireEvents();
// }

//Here, the list items are filtered using the DataManager instance.
// function onKeyUp(e) {
//   var value = document.getElementById('search').value;
//   var data = new ej.data.DataManager(fruitsdata).executeLocal(
//     new ej.data.Query().where('text', 'startswith', value, true)
//   );
//   if (!value) {
//     listViewInstance.dataSource = fruitsdata.slice();
//   } else {
//     listViewInstance.dataSource = data;
//     listViewInstance.dataBind();
//   }
// }
