package space.sausage.data.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;

@Entity
public class App {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    private String name;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String oauthClientDetailsId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOauthClientDetailsId() {
        return oauthClientDetailsId;
    }

    public void setOauthClientDetailsId(String oauthClientDetailsId) {
        this.oauthClientDetailsId = oauthClientDetailsId;
    }

    public App() {}

    public App(String name, User user, String oauthClientDetailsId) {
        this.name = name;
        this.user = user;
        this.oauthClientDetailsId = oauthClientDetailsId;
    }

    @Override
    public String toString() {
        return "App{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", oauthClientDetailsId='" + oauthClientDetailsId + '\'' +
                '}';
    }
}
