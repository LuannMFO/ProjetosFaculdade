const taskInput = document.getElementById('taskInput');
const addTaskBtn = document.getElementById('addTaskBtn');
const taskList = document.getElementById('taskList');

// Função para criar tarefa
function addTask() {
    const taskText = taskInput.value.trim();
    if(taskText === '') return;

    const li = document.createElement('li');
    li.textContent = taskText;

    // Botão de deletar
    const deleteBtn = document.createElement('button');
    deleteBtn.textContent = 'Excluir';
    deleteBtn.className = 'deleteBtn';
    deleteBtn.onclick = () => li.remove();

    // Marcar como concluído ao clicar na tarefa
    li.onclick = (e) => {
        if(e.target !== deleteBtn) {
            li.classList.toggle('completed');
        }
    }

    li.appendChild(deleteBtn);
    taskList.appendChild(li);
    taskInput.value = '';
}

// Eventos
addTaskBtn.addEventListener('click', addTask);
taskInput.addEventListener('keypress', (e) => {
    if(e.key === 'Enter') addTask();
});
