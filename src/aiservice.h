#ifndef AISERVICE_H
#define AISERVICE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class MythAIService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isGenerating READ isGenerating NOTIFY statusChanged)
    Q_PROPERTY(QString lastResponse READ lastResponse NOTIFY responseReceived)

public:
    explicit MythAIService(QObject *parent = nullptr);

    bool isGenerating() const { return m_isGenerating; }
    QString lastResponse() const { return m_lastResponse; }

    Q_INVOKABLE void askAI(const QString &prompt);
    Q_INVOKABLE void executeCommand(const QString &command);

signals:
    void statusChanged();
    void responseChunkReceived(const QString &chunk);
    void responseReceived(const QString &fullText);
    void commandExecuted(const QString &cmd, const QString &output);

private slots:
    void onReplyFinished(QNetworkReply *reply);

private:
    QNetworkAccessManager m_netManager;
    bool m_isGenerating = false;
    QString m_lastResponse;
};

#endif // AISERVICE_H
