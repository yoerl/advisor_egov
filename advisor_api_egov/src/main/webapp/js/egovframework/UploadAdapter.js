class UploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload() {
        return new Promise((resolve, reject) => {
            this._initRequest(resolve, reject);
        });
    }

    _initRequest(resolve, reject) {
        const file = this.loader.file;
        const data = new FormData();
		console.log("file : " + file);
        //data.append('file', file);

		/*<input type="file" name="image" size="60" title="file"/>*/
       $('#imgfile').val(file);

		frm = document.uploadForm;
		inputImage = file;	
		frm.action = "<c:url value='/api/fileUpload.do'/>";
		frm.submit();
/*
		1. 태드추가
		2. 
			frm = document.uploadForm;
	inputImage = frm.image.value;
	
    frm.action = "<c:url value='/api/fileUpload.do'/>";
    frm.submit();
         3. url 치
   */
    }
}
