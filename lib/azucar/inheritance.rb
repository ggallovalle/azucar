module Azucar
    module Inheritance
        class A
            def sum(a)
            a
            end
        end

        class B < A
            def sum(a)
            a + super
            end
        end
    end
end