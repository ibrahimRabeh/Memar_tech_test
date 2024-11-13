document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.menu-item').forEach(item => {
        item.addEventListener('click', () => {
            if (item.classList.contains('Orders')) {
                window.location.href = 'Orders.html';
            } else if (item.classList.contains('Dash')) {
                window.location.href = 'index.html';
            }
        });
    });
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelector('Orders').addEventListener('click', () => {
                    window.location.href = 'Orders.html';
            });
        });
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelector('Dash').addEventListener('click', () => {
                        window.location.href = 'index.html';
                });
            });
    // Show the order details popup
    document.getElementById('openPopupButton').addEventListener('click', () => {
        const popup = document.querySelector('.order-details');
        popup.style.display = 'block';
        popup.style.opacity = '1';
        popup.style.transition = 'all 0.5s';
        popup.style.zIndex = '1000';
        popup.style.position = 'fixed';
        popup.style.top = '50%';
        popup.style.left = '50%';
        popup.style.transform = 'translate(-50%, -50%)';
        popup.style.width = '50%';
        popup.style.height = '50%';
        popup.style.backgroundColor = 'white';
        popup.style.borderRadius = '10px';
        popup.style.boxShadow = '0 0 10px rgba(0, 0, 0, 0.5)';
        popup.style.overflow = 'auto';
        popup.style.padding = '20px';
        popup.style.display = 'flex';
        popup.style.flexDirection = 'column';
        popup.style.justifyContent = 'center';
        popup.style.alignItems = 'center';
    });

    // Close the popup on any close button click
    document.querySelectorAll('.close').forEach(closeBtn => {
        closeBtn.addEventListener('click', () => {
            const popup = document.querySelector('.order-details');
            popup.style.display = 'none';
        });
    });
});
