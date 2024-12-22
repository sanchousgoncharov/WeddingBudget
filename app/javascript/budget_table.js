document.addEventListener('DOMContentLoaded', () => {
  const addRowButton = document.getElementById('add_budget_row');
  const budgetsTableBody = document.querySelector('#budgets_table tbody');

  if (addRowButton && budgetsTableBody) {
    // Считаем количество текущих строк для правильной генерации порядка
    let orderCounter = budgetsTableBody.querySelectorAll('.budget_fields').length;

    addRowButton.addEventListener('click', (event) => {
      event.preventDefault(); // Предотвращает изменение URL (#)

      // Создаем новую строку
      const newRow = document.createElement('tr');
      newRow.className = 'budget_fields'; // Лучше использовать className для совместимости

      // Увеличиваем порядковый номер для новой строки
      orderCounter++;

      newRow.innerHTML = `
        <td><input type="text" name="calculation[budgets_attributes][][title]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][][planned_sum]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][][actual_sum]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][][prepay_sum]" /></td>
        <td><input type="number" name="calculation[budgets_attributes][][remain_sum]" /></td>
        <td><input type="hidden" name="calculation[budgets_attributes][][order]" value="${orderCounter}" /></td>
        <td><a href="#" class="remove_budget_row">Удалить</a></td>
      `;

      // Добавляем строку в таблицу
      budgetsTableBody.appendChild(newRow);
    });

    // Удаление строки
    budgetsTableBody.addEventListener('click', (event) => {
      if (event.target.classList.contains('remove_budget_row')) {
        event.preventDefault();
        const rowToRemove = event.target.closest('tr');
        if (rowToRemove) {
          rowToRemove.remove();
          // После удаления строки пересчитываем порядок для оставшихся строк
          let rows = budgetsTableBody.querySelectorAll('.budget_fields');
          rows.forEach((row, index) => {
            const orderInput = row.querySelector('input[name*="[order]"]');
            if (orderInput) {
              orderInput.value = index + 1; // Переназначаем порядок
            }
          });
        }
      }
    });
  }
});








  