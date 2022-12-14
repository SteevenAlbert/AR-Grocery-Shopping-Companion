var World = {

    init: function initFn() {
        var productID= "";
        this.createOverlays();
    },
    
    createOverlays: function createOverlaysFn() {
        //Load the Targets Tracker (.WTC File)
        this.targetCollectionResource = new AR.TargetCollectionResource("assets/tracker.wtc", {
            onError: World.onError
        });

        //Create an Image Tracker using the loaded Target Collection
        this.tracker = new AR.ImageTracker(this.targetCollectionResource, {
            onTargetsLoaded: World.showInfoBar,
            onError: World.onError
        });

        //Loading the imgButton asset, it's later passed to the createProductButton Helper function.
        this.imgButton = new AR.ImageResource("assets/viewProductButton.png", {
            onError: World.onError
        });

        //Create ViewProduct Button
        var productButton = this.createProductButton(0.1, {
            translate: {
                x: 0,
                y: -0.1
            },
            zOrder: 1
        });
        
        //Product Card to be shown on recognition of an Object
        var productWidget = new AR.HtmlDrawable({
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


        this.product = new AR.ImageTrackable(this.tracker, "*", {
            
            drawables: {
                cam: [productButton,productWidget]
            },
            onImageRecognized: function onImageRecognizedFn(target) {
                World.hideInfoBar;
                World.productID = target.name;
                console.log(target.name);  

            },
            onError: World.onError
        });
    },

    onError: function onErrorFn(error) {
        alert(error);
    },

    createProductButton: function createProductButtonFn(size, options) {
        options.onClick = function() {
            AR.platform.sendJSONObject({action:"product_details", product_id: World.productID});
        };
        return new AR.ImageDrawable(this.imgButton, size, options);
    },

    hideInfoBar: function hideInfoBarFn() {
        document.getElementById("infoBox").style.display = "none";
    },

    showInfoBar: function worldLoadedFn() {
        document.getElementById("infoBox").style.display = "table";
        document.getElementById("loadingMessage").style.display = "none";
    }
};

World.init();