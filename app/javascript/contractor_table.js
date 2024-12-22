document.addEventListener('DOMContentLoaded', () => {
    const addRowButton = document.getElementById('add_contractor_row');
    const budgetsTableBody = document.querySelector('#contractors_table tbody');
    let newRowId = -1; // Для новых строк используем отрицательные идентификаторы
  
    if (addRowButton && budgetsTableBody) {
      addRowButton.addEventListener('click', (event) => {
        event.preventDefault();
  
        const newRow = document.createElement('tr');
        newRow.className = 'contractor_fields';
  
        newRow.innerHTML = `
          <td><input type="text" name="calculation[contractors_attributes][${newRowId}][category]" /></td>
          <td><input type="text" name="calculation[contractors_attributes][${newRowId}][responsible]" /></td>
          <td><input type="text" name="calculation[contractors_attributes][${newRowId}][description]" /></td>
          <td><input type="checkbox" name="calculation[contractors_attributes][${newRowId}][status]" /></td>
          <td><input type="text" name="calculation[contractors_attributes][${newRowId}][name]" /></td>
          <td><input type="text" name="calculation[contractors_attributes][${newRowId}][phone]" /></td>
          <td><input type="text" name="calculation[contractors_attributes][${newRowId}][email]" /></td>
          <td>
            <a href="#" class="remove_contractor_row">Удалить</a>
            <input type="hidden" name="calculation[contractors_attributes][${newRowId}][_destroy]" value="false" />
          </td>
        `;
        newRowId--;
  
        budgetsTableBody.appendChild(newRow);
      });
  
      budgetsTableBody.addEventListener('click', (event) => {
        if (event.target.classList.contains('remove_contractor_row')) {
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