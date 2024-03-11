    package UserDAO;

    public class User {
        private final String name;
        private final String email;
        private final int pin;
        private final String phone;
        private final String password;
        private final String option1;
        private final String inputone;
        private final String option2;
        private final String inputtwo;
        private final String option3;
        private final String inputthree;

        public User(String name, String email, int pin, String phone, String password, String option1, String inputone, String option2, String inputtwo, String option3, String inputthree) {
            this.name = name;
            this.email = email;
            this.pin = pin;
            this.phone = phone;
            this.password = password;
            this.option1 = option1;
            this.inputone = inputone;
            this.option2 = option2;
            this.inputtwo = inputtwo;
            this.option3 = option3;
            this.inputthree = inputthree;
        }

        public String getName() {
            return name;
        }

        public String getEmail() {
            return email;
        }

        public int getPin() {
            return pin;
        }

        public String getPhone() {
            return phone;
        }

        public String getPassword() {
            return password;
        }

        public String getOption1() {
            return option1;
        }

        public String getInputone() {
            return inputone;
        }

        public String getOption2() {
            return option2;
        }

        public String getInputtwo() {
            return inputtwo;
        }

        public String getOption3() {
            return option3;
        }

        public String getInputthree() {
            return inputthree;
        }
    }
