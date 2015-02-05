'use strict';

angular.module('app', ['angularFileUpload'])
    
    .controller('CvGeneratorController', ['$scope', 'FileUploader', function($scope, FileUploader) {

        $scope.result = '';

        var uploader = $scope.uploader = new FileUploader({
            url: '/Home/UploadFile'
        });

        // FILTERS
        uploader.filters.push({
            name: 'customFilter',
            fn: function(item /*{File|FileLikeObject}*/, options) {
                return this.queue.length < 1;
            }
        });

        //uploader.filters.push({
        //    name: 'FileTypeFilter',
        //    fn: function (item) {
        //        return item.type == 'text/html' || item.type == 'text/plain';
        //    }
        //});

        // CALLBACKS
        uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
            console.info('onWhenAddingFileFailed', item, filter, options);
        };
        uploader.onAfterAddingFile = function(fileItem) {
            console.info('onAfterAddingFile', fileItem);
        };
        uploader.onAfterAddingAll = function(addedFileItems) {
            console.info('onAfterAddingAll', addedFileItems);
        };
        uploader.onBeforeUploadItem = function(item) {
            console.info('onBeforeUploadItem', item);
        };
        uploader.onProgressItem = function(fileItem, progress) {
            console.info('onProgressItem', fileItem, progress);
        };
        uploader.onProgressAll = function(progress) {
            console.info('onProgressAll', progress);
        };
        uploader.onSuccessItem = function(fileItem, response, status, headers) {
            console.info('onSuccessItem', fileItem, response, status, headers);
        };
        uploader.onErrorItem = function(fileItem, response, status, headers) {
            console.info('onErrorItem', fileItem, response, status, headers);
        };
        uploader.onCancelItem = function(fileItem, response, status, headers) {
            console.info('onCancelItem', fileItem, response, status, headers);
        };
        uploader.onCompleteItem = function (fileItem, response, status, headers) {
            $scope.result = response;
            console.info('My Response', response);
            console.info('Result', $scope.result);

            //console.info('Retunred me!', fileItem, response, status, headers);
        };
        uploader.onCompleteAll = function() {
            console.info('Returned All');
        };
        console.info('uploader', uploader);
    }]);