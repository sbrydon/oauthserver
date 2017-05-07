package space.sausage.security;

public class UsernameExistsException extends Exception {
    public UsernameExistsException() {
        super("username already exists");
    }
}
