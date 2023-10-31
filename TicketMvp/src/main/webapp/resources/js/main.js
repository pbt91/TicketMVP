// JavaScript 코드
window.addEventListener("load", function() {
    const evenImages = document.querySelectorAll(".image-item.even img");
    const oddImages = document.querySelectorAll(".image-item.odd img");

    // 특정 이미지의 세로 크기를 가져옵니다. 여기서는 pic.01의 이미지를 기준으로 합니다.
    const referenceImageHeight = document.querySelector("img[src='resources/images/member_images/pic.01.jpg']").height;

    // .even 이미지들의 세로 크기를 설정합니다.
    evenImages.forEach(function(image) {
        image.style.height = referenceImageHeight + "px";
    });

    // .odd 이미지들의 세로 크기를 설정합니다.
    oddImages.forEach(function(image) {
        // 특정 이미지의 세로 크기를 가져옵니다. 여기서는 pic.02의 이미지를 기준으로 합니다.
        const referenceImageHeight = document.querySelector("img[src='resources/images/member_images/pic.02.jpg']").height;
        image.style.height = referenceImageHeight + "px";
    });
});
