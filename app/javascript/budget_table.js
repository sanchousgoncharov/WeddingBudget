document.addEventListener('DOMContentLoaded', () => {
  const addRowButton = document.getElementById('add_budget_row');
  const budgetsTableBody = document.querySelector('#budgets_table tbody');
  let newRowId = -1; // Для новых строк используем отрицательные идентификаторы

  if (addRowButton && budgetsTableBody) {
    addRowButton.addEventListener('click', (event) => {
      event.preventDefault();

      const newRow = document.createElement('tr');
      newRow.className = 'budget_fields';

      newRow.innerHTML = `
        <td><input type="text" name="calculation[budgets_attributes][${newRowId}][title]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][${newRowId}][planned_sum]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][${newRowId}][actual_sum]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][${newRowId}][prepay_sum]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][${newRowId}][remain_sum]" /></td>
        <td>
          <a href="#" class="remove_budget_row">Удалить</a>
          <input type="hidden" name="calculation[budgets_attributes][${newRowId}][_destroy]" value="false" />
        </td>
      `;
      newRowId--;

      budgetsTableBody.appendChild(newRow);
    });

    budgetsTableBody.addEventListener('click', (event) => {
      if (event.target.classList.contains('remove_budget_row')) {
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
