/*******************************************************************************
 *
 *  Copyright 2012 - Sardegna Ricerche, Distretto ICT, Pula, Italy
 *
 * Licensed under the EUPL, Version 1.1.
 * You may not use this work except in compliance with the Licence.
 * You may obtain a copy of the Licence at:
 *
 *  http://www.osor.eu/eupl
 *
 * Unless required by applicable law or agreed to in  writing, software distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and limitations under the Licence.
 * In case of controversy the competent court is the Court of Cagliari (Italy).
 *******************************************************************************/
/*
 * @class ImageView
 * @parent Backbone.View
 * @constructor
 * Show or edit an image.
 * @tag views
 * @author LabOpenSource
 */
window.ImageView = Backbone.View.extend({
    indexTemplate: $("#image-view-template"),
    events: {
        "click div": "switchMode"
    },
    initialize: function () {
        this.model.bind('change', this.render, this);
        this.render();

    },
    render: function () {
        $(this.el).html(Mustache.to_html(this.indexTemplate.html(), this.model));
        if (this.$("#uploadFacility").length) {
            this.$("#uploadFacility").uploadImage(this);
        }

        this.delegateEvents();
        return this;
    },
    switchMode: function () {
        this.indexTemplate = (this.indexTemplate.attr("id") == "image-view-template") ? $("#image-edit-template") : $("#image-view-template");
        this.render();
        var self = this;

        $(this.el).undelegate("div", "click");
        $('<div></div>').overlay({
            effect: 'fade',
            onShow: function () {
                var overlay = this;
                $(self.el).addClass("edit-state-box");
                $(this).click(function () {
                    if (confirm($.i18n("alertExitEditState"))) {
                        $(self.el).removeClass("edit-state-box");
                        self.indexTemplate = $("#image-view-template");
                        self.render();
                        $(overlay).remove();
                        $($.fn.overlay.defaults.container).css('overflow', 'auto');

                    }

                });
            }
        });
    }


});

/*
 * @class EditImageView
 * @parent Backbone.View
 * @constructor
 * Show or edit a image.
 * @tag views
 * @author LabOpenSource
 */
window.EditImageView = EditView.extend({
    events: {
        "submit form": "save",
        "click div": "switchMode"
    },
    initialize: function () {
        this.model.bind('change', this.render, this);
        // initialize thumbnail view which show an image that represent a facility
        this.imageView = new ImageView({
            model: new Image()
        });

    },

    render: function () {
        // render main edit view
        var modelToRender = this.model.toJSON();
        // set additional attributes to display in the template. Only for the view.
        if (this.model.isNew()) {
            // add additional fields eventually..
        	this.indexTemplate =  (this.indexTemplate == "edit-template" )? $("#image-edit-template") : $("#edit-template");
        }

        $(this.el).html(Mustache.to_html(this.indexTemplate.html(), modelToRender));
        // add validation check
        this.$(".yform").validate();
        // renderize buttons
        $(".btn_save").button({
            icons: {
                primary: "ui-icon-check"
            }
        });

        $(".btn_reset").button({
            icons: {
                primary: "ui-icon-arrowreturnthick-1-w"
            }
        }).click(function (event) {
            var validator = $(this).parents(".yform").validate();
            validator.resetForm();
            return false;
        });
        this.renderAssociated();
        this.delegateEvents();
        return this;
    },
    /**
     * Render associated views
     */
    renderAssociated: function () {
        // check if model has changed or is new, then update collections in associated views
        if (!this.model.isNew()) {
            var self = this;
            this.id = this.model.get("id");
            this.imageView.unbind("child:update");
            this.imageView.model.set(this.model.get("image").file);

            // listen for changes in model on editing and fetch model if any change occur.
            this.imageView.bind("child:update", function () {
                self.model.fetch({
                    silent: true,
                    success: function () {
                        //set collection for associated views
                        self.imageView.model.set(this.model.get("image").file);
                        $(self.imageView.el).undelegate("div", "click");
                    }
                });
            });

            // now render associated views
            if ($("#thumbnail").is(':empty')) {
                $("#thumbnail").html(this.imageView.el);
            }

        }
    }
});