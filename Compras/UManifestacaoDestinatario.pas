unit UManifestacaoDestinatario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, DBCtrls, Mask;

type
  TFManifestacaoDestinatario = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BtEnviar: TBitBtn;
    DsManifestDest: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    btAlterar: TSpeedButton;
    btSalvar: TSpeedButton;
    btCancelar: TSpeedButton;
    btExcluir: TSpeedButton;
    btIncluir: TSpeedButton;
    btProx: TSpeedButton;
    btAnt: TSpeedButton;
    Label3: TLabel;
    DsEvento: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btAntClick(Sender: TObject);
    procedure btProxClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure BtEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    fNota : Integer;
    fChaveAcesso: String;
    procedure GerenciaBotoes(modo: integer);
  public
    { Public declarations }
    Property pCodNota : Integer Read fNota Write fNota;
    Property pChaveAcesso: String Read fChaveAcesso Write fChaveAcesso;
  end;

var
  FManifestacaoDestinatario: TFManifestacaoDestinatario;

implementation

uses UNfe_cl, NfeUtils, UNotaEntrada_cl;

{$R *.dfm}

procedure TFManifestacaoDestinatario.btAntClick(Sender: TObject);
begin
  DsManifestDest.DataSet.Prior;
end;

procedure TFManifestacaoDestinatario.btProxClick(Sender: TObject);
begin
  DsManifestDest.DataSet.Next;
end;

procedure TFManifestacaoDestinatario.btIncluirClick(Sender: TObject);
begin
  with DMNfe do
  begin
    if QManifestDest.RecordCount > 0 then
    begin
      QManifestDest.Refresh;
      QManifestDest.Last;
      if QManifestDestDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      begin
        QManifestDest.Insert;
        QManifestDestCOD_NOTA_CAB.Value := fNota;
        QManifestDestTP_EVENTO.Value := '210200';
        QManifestDestNSEQ_EVENTO.Value := 1;
        QManifestDestID_LOTE.Value := QManifestDestID_LOTE.Value;
        QManifestDestDESC_CHAVE_ACESSO.Value := fChaveAcesso;
        QManifestDestID_EVENTO.Value := 'ID'+ QManifestDestTP_EVENTO.Value + fChaveAcesso + '01';
        QManifestDestDT_EVENTO.Value := Now;
        GerenciaBotoes(1);
      end
      else
        MessageDlg('Antes de criar uma nova manifestação, envie a correção que está pendente.', mtError, [mbOK], 0);
    end
    else
    begin
      QManifestDest.Insert;
      QManifestDestCOD_NOTA_CAB.Value := fNota;
      QManifestDestTP_EVENTO.Value := '210200';
      QManifestDestNSEQ_EVENTO.Value := 1;
      QManifestDestID_LOTE.Value := QManifestDestID_LOTE.Value;
      QManifestDestDESC_CHAVE_ACESSO.Value := fChaveAcesso;
      QManifestDestID_EVENTO.Value := 'ID'+ QManifestDestTP_EVENTO.Value + fChaveAcesso + '01';
      QManifestDestDT_EVENTO.Value := Now;
      GerenciaBotoes(1);
    end;
  end;
end;

procedure TFManifestacaoDestinatario.btAlterarClick(Sender: TObject);
begin
  with DMNfe do
  begin
    if QManifestDestDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('Esta manifestação já foi enviada e autorizada pela Sefaz. Não é possível alterá-la.', mtError, [mbOK], 0)
    else
    begin
      QManifestDest.Edit;
      GerenciaBotoes(1);
    end;
  end;
end;

procedure TFManifestacaoDestinatario.btSalvarClick(Sender: TObject);
begin
  if (DsManifestDest.State = dsEdit) or (DsManifestDest.State = dsInsert) then
  begin
    if ((Trim(DBMemo1.Text) = '') or (length(Trim(DBMemo1.Text)) < 15)) and (DMNfe.QManifestDestTP_EVENTO.Value = '210240') then
    begin
      MessageDlg('Insira algum texto no campo "Justificativa". No mínimo, 15 caracteres.', mtError, [mbOK], 0);
      Abort;
    end;
    DMNfe.QManifestDestDESC_EVENTO.Value := DBLookupComboBox1.Text;
    DsManifestDest.DataSet.Post;
    if DsManifestDest.DataSet.RecordCount > 0 then
      GerenciaBotoes(2)
    else
      GerenciaBotoes(3);
  end
  else
  begin
    DMNfe.QManifestDest.Refresh;
    DMNfe.QManifestDest.Last;
  end;
end;

procedure TFManifestacaoDestinatario.btCancelarClick(Sender: TObject);
begin
  DsManifestDest.DataSet.Cancel;
  if DsManifestDest.DataSet.RecordCount > 0 then
    GerenciaBotoes(2)
  else
    GerenciaBotoes(3);
end;

procedure TFManifestacaoDestinatario.btExcluirClick(Sender: TObject);
begin
  with DMNfe do
  begin
    if QManifestDestDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('Esta manifestação já foi enviada e autorizada pela Sefaz. Não é possível excluí-la.', mtError, [mbOK], 0)
    else if MessageDlg('Apagar esta correção?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        QManifestDest.Delete;
  end;
  if DsManifestDest.DataSet.RecordCount > 0 then
    GerenciaBotoes(2)
  else
    GerenciaBotoes(3);
end;

procedure TFManifestacaoDestinatario.GerenciaBotoes(modo: integer);
begin
  case modo of
    1:
      begin
        btAnt.Enabled:=false;
        btProx.Enabled:=false;
        btIncluir.Enabled:=false;
        btAlterar.Enabled:=false;
        btSalvar.Enabled:=true;
        btCancelar.Enabled:=true;
        btExcluir.Enabled:=false;
      end;
    2:
      begin
        btAnt.Enabled:=true;
        btProx.Enabled:=true;
        btIncluir.Enabled:=true;
        btAlterar.Enabled:=true;
        btSalvar.Enabled:=false;
        btCancelar.Enabled:=false;
        btExcluir.Enabled:=true;
      end;
    3:
      begin
        btAnt.Enabled:=false;
        btProx.Enabled:=false;
        btIncluir.Enabled:=true;
        btAlterar.Enabled:=false;
        btSalvar.Enabled:=false;
        btCancelar.Enabled:=false;
        btExcluir.Enabled:=false;
      end;
  end;
end;

procedure TFManifestacaoDestinatario.BtEnviarClick(Sender: TObject);
begin
  btSalvarClick(self);
  with DMNfe do
  begin
    if QManifestDestDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('A manifestação já foi enviada e autorizada pela Sefaz. Crie uma nova correção e tente o envio.', mtError, [mbOK], 0)
    else
    begin
      EmiteManifestacaoDestinatario;
      DsManifestDest.DataSet.Refresh;
      DsManifestDest.DataSet.Last;
    end;
  end;
end;

procedure TFManifestacaoDestinatario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMNfe.QManifestDest.Cancel;
end;

procedure TFManifestacaoDestinatario.FormActivate(Sender: TObject);
begin
  with DMNfe do
  begin
    QEvento.Close;
    QEvento.Open;
    QManifestDest.Close;
    QManifestDest.SetVariable('COD_NOTA_CAB',fNota);
    QManifestDest.Open;
    if QManifestDest.RecordCount = 0 then
      btIncluirClick(Self)
    else
    begin
      QManifestDest.Last;
      if (QManifestDestDESC_RETORNO_PROCESSAMENTO.Value = '135') or (QManifestDestDESC_RETORNO_PROCESSAMENTO.Value = '136') then
        GerenciaBotoes(2)
      else
      begin
        QManifestDest.Edit;
        QManifestDestDESC_CHAVE_ACESSO.Value := fChaveAcesso;
        QManifestDestID_EVENTO.Value := 'ID'+ QManifestDestTP_EVENTO.Value + fChaveAcesso + '01';
        GerenciaBotoes(1);
      end;
    end;
  end;
end;

end.
