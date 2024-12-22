document.addEventListener('DOMContentLoaded', () => {
    const addRowButton = document.getElementById('add_alco_row');
    const budgetsTableBody = document.querySelector('#alcos_table tbody');
    let newRowId = -1; // Для новых строк используем отрицательные идентификаторы
  
    if (addRowButton && budgetsTableBody) {
      addRowButton.addEventListener('click', (event) => {
        event.preventDefault();
  
        const newRow = document.createElement('tr');
        newRow.className = 'alco_fields';
  
        newRow.innerHTML = `
          <td><input type="text" name="calculation[alcos_attributes][${newRowId}][title]" /></td>
          <td><input type="text" name="calculation[alcos_attributes][${newRowId}][litres_for_one]" /></td>
          <td>
            <a href="#" class="remove_alco_row">Удалить</a>
            <input type="hidden" name="calculation[alcos_attributes][${newRowId}][_destroy]" value="false" />
          </td>
        `;
        newRowId--;
  
        budgetsTableBody.appendChild(newRow);
      });
  
      budgetsTableBody.addEventListener('click', (event) => {
        if (event.target.classList.contains('remove_alco_row')) {
          event.preventDefault();
          const rowToRemove = event.target.closest('tr');
          const inputToDestroy = rowToRemove.querySelector('input[name*="[_destroy]"]');
          if (inputToDestroy) {
            inputToDestroy.value = "true";
          }
          rowToRemove.style.display = 'none'; // Скрываем строку вместо удаления из DOM
        }
      });
    }
  });