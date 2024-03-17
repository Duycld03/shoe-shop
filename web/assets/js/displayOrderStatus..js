// Tạo một đối tượng ánh xạ giữa các giá trị orderStatus và các lớp CSS Bootstrap tương ứng
const statusClassMap = {
    "Success": "btn btn-success",
    "Cancel": "btn btn-danger",
    "Processing": "btn btn-warning",
    "Accepted": "btn btn-info"
};

// Lấy phần tử HTML có class là 'Status'
const orderStatusElement = document.querySelector('.Status');

// Lấy giá trị orderStatus từ nội dung của phần tử HTML
const orderStatus = orderStatusElement.textContent.trim();

// Lấy lớp CSS Bootstrap tương ứng từ đối tượng statusClassMap
const statusClass = statusClassMap[orderStatus];

// Thêm lớp CSS và cập nhật nội dung của phần tử HTML
orderStatusElement.innerHTML = `<button type="button" class="text-white font-weight-bold ${statusClass} btn-lg">${orderStatus}</button>`;
