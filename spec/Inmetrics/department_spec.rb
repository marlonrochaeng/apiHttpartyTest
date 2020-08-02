describe 'DEPARTMENTS' do 

    context 'DEPARTMENTS test cases' do 

        def register_department
            Department.post('/departamento/cadastrar', :basic_auth => @auth, :body => @department_to_add.to_json, :headers => @headers)
        end
        

        before {

            @auth = {username: "inmetrics", password: "automacao"}

            @department_id = 4

            @department_to_add = {
                    local: Faker::Name.first_name,
                    nomeDepartamento: Faker::Name.last_name,
                    orcamento: "1.000,00"
            }

            @headers = {
                'Content-Type': 'application/json'
            }

        }

        it 'test case 11 - list all departments' do
            @departments = Department.get('/departamento/list_all', :basic_auth => @auth)

            expect(@departments.length).to be > 0
            expect(@departments[0]['local']).to eq('Adm')
            expect(@departments.code).to eq(200)
        end

        it 'test case 7 - show department by id' do
            @department = Department.get('/departamento/list/'+@department_id.to_s, :basic_auth => @auth)

            expect(@department['local']).to eq('Crato')
            expect(@department['nomeDepartamento']).to eq('Desenvolvimento')
        end

        it 'test case 8 - create department' do
            @department = register_department()

            expect(@department.code).to eq(200)           
            expect(@department['local']).to eq(@department_to_add[:local])
        end

        it 'test case 9 - edit department' do
            @department = JSON.parse(register_department().body)
            @department['local'] = "Teste"
            @department['nomeDepartamento'] = "Teste"

            @changed_dep = Department.put('/departamento/alterar/'+@department['departamentoId'].to_s, :basic_auth => @auth, :body => @department.to_json, :headers => @headers)
            
            expect(@changed_dep.code).to eq(202)           
            expect(@changed_dep['local']).to eq('Teste')
            expect(@changed_dep['nomeDepartamento']).to eq('Teste')
        end

        it 'test case 10 - delete department' do
            @department = register_department()
            @deleted_dep = Department.delete('/departamento/deletar/'+@department['departamentoId'].to_s, :basic_auth => @auth, :headers => @headers)

            expect(@deleted_dep.code).to eq(202)           
            expect(@deleted_dep.to_s).to eq('Deletado')

        end

    end

end