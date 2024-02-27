let dataTable;
let dataTableIsInitialized = false;
const dataTableOptions = { 
   pageLength: 3,
   destroy:true,
   language:  {
    lengthMenu:"Mostrar _MENU_ registros por pagina",
    zeroRecords: "Ningun usuario encontrado",
    info: "Mostrando de _Start_ a _END_ de un total de _TOTAL_ registros",
    infoEmpty: "Ningun usuario encontrado",
    infoFilteres: "(filtrados desde _Max_ registros totales)",
    search: "Bsucar:",
    loadingRecords: "Cargando...",
    paginate: {
      first: "Primero",
      last: "Ultimo",
      next: "Siguiente",
      previous: "Anterior"
  }
  }
};

const initDataTable = async () => {
  if(dataTableIsInitialized) {
    dataTable.destroy();
  }
  await listUsers();
  dataTable = $("#datatable_users").DataTable(dataTableOptions);

  dataTableIsInitialized = true;
};

const listUsers = async() => {
  try {
    const response=await fetch("https://jsonplaceholder.typicode.com/users");
    const users = await response.json();
    let content = `` ;
   users.forEach((user,index)=>{
    content += `
    <tr>
    <td>${index + 1}</td>
    <td>${user.name}</td>
    <td>${user.email}</td>
    <td>${user.address.city}</td>
    <td>${user.company.name}</td>
    </tr>`;
  });
  tableBody_users.innerHTML = content;
  }catch (ex) {
    alert(ex);
  }
};

    window.addEventListener("load", async() => {
      await initDataTable();

});