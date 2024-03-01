function redirectToDetailPage(productId) {
    window.location.href = '/product?proID=' + productId;
}

function message(status, title, text, callback) {
    Swal.fire({
        title: title,
        text: text,
        icon: status
    }).then(callback);
}