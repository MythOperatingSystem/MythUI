#ifndef SYSTEMSETTINGS_H
#define SYSTEMSETTINGS_H

#include <QObject>
#include <QProcess>

class MythSystemSettings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(bool isMuted READ isMuted WRITE setMuted NOTIFY muteChanged)
    Q_PROPERTY(int brightness READ brightness WRITE setBrightness NOTIFY brightnessChanged)
    Q_PROPERTY(bool wifiEnabled READ wifiEnabled WRITE setWifiEnabled NOTIFY wifiStateChanged)
    Q_PROPERTY(QString wifiSSID READ wifiSSID NOTIFY wifiStateChanged)

public:
    explicit MythSystemSettings(QObject *parent = nullptr);

    int volume() const { return m_volume; }
    void setVolume(int percent);

    bool isMuted() const { return m_isMuted; }
    void setMuted(bool mute);

    int brightness() const { return m_brightness; }
    void setBrightness(int percent);

    bool wifiEnabled() const { return m_wifiEnabled; }
    void setWifiEnabled(bool enabled);

    QString wifiSSID() const { return m_wifiSSID; }

    Q_INVOKABLE void refreshState();

signals:
    void volumeChanged();
    void muteChanged();
    void brightnessChanged();
    void wifiStateChanged();

private:
    void queryVolume();
    void queryBrightness();
    void queryWifi();

    int m_volume = 75;
    bool m_isMuted = false;
    int m_brightness = 80;
    bool m_wifiEnabled = true;
    QString m_wifiSSID = "Myth_5G";
};

#endif // SYSTEMSETTINGS_H
