package space.sausage.web.dto;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.AssertTrue;

public class AppDto {
    @NotBlank
    private String name;

    @NotBlank
    private String clientId;

    @NotBlank
    private String clientSecret;

    private String confirmClientSecret;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }

    public String getConfirmClientSecret() {
        return confirmClientSecret;
    }

    public void setConfirmClientSecret(String confirmClientSecret) {
        this.confirmClientSecret = confirmClientSecret;
    }

    @AssertTrue(message="client secrets don't match")
    public boolean isClientSecretMatch() {
        return clientSecret != null && clientSecret.equals(getConfirmClientSecret());
    }
}
