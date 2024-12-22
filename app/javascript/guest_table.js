document.addEventListener('DOMContentLoaded', () => {
    const addRowButton = document.getElementById('add_guest_row');
    const budgetsTableBody = document.querySelector('#guests_table tbody');
    let newRowId = -1; // Для новых строк используем отрицательные идентификаторы
  
    if (addRowButton && budgetsTableBody) {
      addRowButton.addEventListener('click', (event) => {
        event.preventDefault();
  
        const newRow = document.createElement('tr');
        newRow.className = 'guest_fields';
  
        newRow.innerHTML = `
          <td><input type="text" name="calculation[guests_attributes][${newRowId}][name]" /></td>
          <td><input type="text" name="calculation[guests_attributes][${newRowId}][phone]" /></td>
          <td><input type="checkbox" name="calculation[guests_attributes][${newRowId}][invited]" /></td>
          <td><input type="checkbox" name="calculation[guests_attributes][${newRowId}][arrive]" /></td>
          <td><input type="checkbox" name="calculation[guests_attributes][${newRowId}][zags]" /></td>
          <td><input type="checkbox" name="calculation[guests_attributes][${newRowId}][party]" /></td>
          <td><input type="text" name="calculation[guests_attributes][${newRowId}][guest]" /></td>
          <td>
            <a href="#" class="remove_guest_row">Удалить</a>
            <input type="hidden" name="calculation[guests_attributes][${newRowId}][_destroy]" value="false" />
          </td>
        `;
        newRowId--;
  
        budgetsTableBody.appendChild(newRow);
      });
  
      budgetsTableBody.addEventListener('click', (event) => {
        if (event.target.classList.contains('remove_guest_row')) {
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