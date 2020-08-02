describe 'Employees' do 

    context 'Employee test cases' do 

        def register_user
            Employee.post('/empregado/cadastrar', :basic_auth => @auth, :body => @employee_to_add.to_json, :headers => @headers)
        end
        

        before {

            @auth = {username: "inmetrics", password: "automacao"}
            @employee_id = 401
            @employee_to_add = {
                
                    admissao: "30/04/1990",
                    cargo: "QA",
                    comissao: "1.000,01",
                    cpf: "585.947.930-14",
                    departamentoId: 1,
                    nome: Faker::Name.name,
                    salario: "1.000,01",
                    sexo: "m",
                    tipoContratacao: "pj"
                
            }

            @headers = {
                'Content-Type': 'application/json'
            }

        }

        it 'test case 1 - list all employees' do
            @employees = Employee.get('/empregado/list_all', :basic_auth => @auth)
            expect(@employees.length).to be > 0
            expect(@employees.code).to eq(200)
        end

        it 'test case 2 - show employee by ID and check its info' do
            @employee = Employee.get('/empregado/list/'+@employee_id.to_s, :basic_auth => @auth)
 
            expect(@employee.code).to eq(202)
            expect(@employee['sexo']).to eq("m")
            expect(@employee['cpf']).to eq("585.947.930-14")
            #validation could goes on
        end

        it 'test case 3 - register employee' do
            @employee = register_user()

            expect(@employee.code).to eq(202)
            expect(@employee['empregadoId']).to be > 0
            expect(@employee['salario']).to eq('1.000,01')
            #validation could goes on
        end

        it 'test case 4 - edit employee' do
            @employee_to_add['salario'] = '11.000,01'
            @employee = Employee.put('/empregado/alterar/'+@employee_id.to_s, :basic_auth => @auth, :body => @employee_to_add.to_json, :headers => @headers)
            
            expect(@employee.code).to eq(202)
            expect(@employee['salario']).to eq('11.000,01')
            #validation could goes on
        end

        it 'test case 5 - delete employee' do
            @employee = register_user()
            @employee = Employee.delete('/empregado/deletar/'+@employee['empregadoId'].to_s, :basic_auth => @auth,)

            expect(@employee.code).to eq(202)
            expect(@employee.to_s).to eq('Deletado')
        end

    end

end