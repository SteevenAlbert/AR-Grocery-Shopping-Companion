var World = {

    init: function initFn() {     
        var productID= "";      //Fetched from Wikitude 
        var productName= "";    //Set from Flutter
        var productCard= "";
        this.createOverlays();
    },

    loadProduct: function loadProductFn(data) {
         World.productName = data["name"];      
    },
    

    /*---------------------------MAIN FUNCTIONS-----------------------*/
    createOverlays: function createOverlaysFn() {

        /*-------------------*/
        //  Loading Trackers //
        /*------------------*/
        //Load the Targets Tracker (.WTC File)
        this.targetCollectionResource = new AR.TargetCollectionResource("assets/tracker.wtc", {
            onError: World.onError
        });

        //Create an Image Tracker using the loaded Target Collection
        this.tracker = new AR.ImageTracker(this.targetCollectionResource, {
            onTargetsLoaded: World.showInfoBar,
            onError: World.onError
        });

        //Load the imgButton asset, it's later passed to the createProductButton Helper function.
        this.imgButton = new AR.ImageResource("assets/viewProductButton.png", {
            onError: World.onError
        });

        
        /*-----------------------*/
        //  Product Overlays UI  //
        /*----------------------*/
        this.productCard = new AR.HtmlDrawable({
            uri: "assets/product_card.html"
        }, 0.7, {
        
            viewportWidth: 200,
            viewportHeight: 160,
            backgroundColor: "#0000004d",
            translate: {
                x: 0.36,
                y: 0.5
            },
            horizontalAnchor: AR.CONST.HORIZONTAL_ANCHOR.RIGHT,
            verticalAnchor: AR.CONST.VERTICAL_ANCHOR.TOP,
            clickThroughEnabled: true,
            allowDocumentLocationChanges: false,
            onDocumentLocationChanged: function onDocumentLocationChangedFn(uri) {
                AR.context.openInBrowser(uri);
            },
            onError: World.onError
        });

        var productButton = this.createProductButton(0.1, {
            translate: {
                x: 0,
                y: -0.1
            },
            zOrder: 1
        });

        //Set which image to track, and what to display on recognition
        //Triggered on image recognition, '*' means all images in a targetCollection
        this.product = new AR.ImageTrackable(this.tracker, "*", {           
            drawables: {
                cam: [productButton, this.productCard]
            },
            onImageRecognized: function onImageRecognizedFn(product) {
                World.productID = product.name;
                AR.platform.sendJSONObject({action:"product_card", product_id: World.productID});
                
                World.updateCard();
            },
         
            onError: World.onError
        });
    },



    /*-------------------HELPER FUNCTIONS--------------------*/
    onError: function onErrorFn(error) {
        alert(error);
    },

    updateCard: function updateCardFn(){
        return new Promise((resolve) => {
            var htmlHeadString =                   
            '<head>' + 
            '<meta name="viewport" content="width = 200, user-scalable = 0">' +
                '<style>' +
                        '.card {' +
                          'box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);' +
                          'max-width: 300px;' +
                          'text-align: center;' +
                          'font-family: arial;' +
                          'opacity: 0.7;' +
                        '}' +
                        'h1 {' +
                           'color: rgb(255, 255, 255);' +
                           'font-family: "Helvetica Neue", sans-serif;' +
                           'font-size: 24px;' +
                           'font-weight: bold;' +
                           'letter-spacing: -1px;' +
                           'line-height: 1;' +
                           'text-align: center;' +
                        '}' +
                        '.calories{' +
                          'color: rgb(255, 255, 255);' +
                          'font-size: 18px;' +
                        '}' +
                        '.card button {' +
                          'border: none;' +
                          'outline: 0;' +
                          'padding: 12px;' +
                          'color: white;' +
                          'background-color: #549E83;' +
                          'text-align: center;' +
                          'cursor: pointer;' +
                          'width: 100%;' +
                          'font-size: 18px;' +
                        '}' +
                        '.card button:hover {' +
                          'opacity: 1;'+
                          '}' +
                '</style>';
            '</head>' ;
            var htmlBodyString = 
                    '<body>' + 
                    '<div class="card" id="ca">' +
                    '<h1 id="Title">'+World.productName+'</h1>' +
                    '<p class="calories">192 cal</p>' +
                    '<p id="small">Ingredients and stuff</p>' +
                 '</div>' +
                 '</body>';
                 
            World.productCard.evalJavaScript("document.documentElement.innerHTML = '"+htmlHeadString + htmlBodyString + "';");

            resolve();
        });
    },
 
    clearCard: function clearCardFn(){
        return new Promise((resolve) => {
            var htmlHeadString =                   
            '<head>' + 
            '<meta name="viewport" content="width = 200, user-scalable = 0">' +
                '<style>' +
                        '.card {' +
                          'box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);' +
                          'max-width: 300px;' +
                          'text-align: center;' +
                          'font-family: arial;' +
                          'opacity: 0.7;' +
                        '}' +
                        'h1 {' +
                           'color: rgb(255, 255, 255);' +
                           'font-family: "Helvetica Neue", sans-serif;' +
                           'font-size: 24px;' +
                           'font-weight: bold;' +
                           'letter-spacing: -1px;' +
                           'line-height: 1;' +
                           'text-align: center;' +
                        '}' +
                        '.calories{' +
                          'color: rgb(255, 255, 255);' +
                          'font-size: 18px;' +
                        '}' +
                        '.card button {' +
                          'border: none;' +
                          'outline: 0;' +
                          'padding: 12px;' +
                          'color: white;' +
                          'background-color: #549E83;' +
                          'text-align: center;' +
                          'cursor: pointer;' +
                          'width: 100%;' +
                          'font-size: 18px;' +
                        '}' +
                        '.card button:hover {' +
                          'opacity: 1;'+
                          '}' +
                '</style>';
            '</head>' ;
            var htmlBodyString = 
                    '<body>' + 
                    
                 '</body>';
                 
            World.productCard.evalJavaScript("document.documentElement.innerHTML = '"+htmlHeadString + htmlBodyString + "';");

            resolve();
        });
    },
    createProductButton: function createProductButtonFn(size, options) {
        options.onClick = function() {
            AR.platform.sendJSONObject({action:"product_card", product_id: World.productID});
        };
        return new AR.ImageDrawable(this.imgButton, size, options);
    },

    // hideInfoBar: function hideInfoBarFn() {
    //     document.getElementById("infoBox").style.display = "none";
    // },

    // showInfoBar: function worldLoadedFn() {
    //     document.getElementById("infoBox").style.display = "table";
    //     document.getElementById("loadingMessage").style.display = "none";
    // }
};

World.init();