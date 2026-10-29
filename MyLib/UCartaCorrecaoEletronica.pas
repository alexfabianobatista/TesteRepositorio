unit UCartaCorrecaoEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBCtrls, StdCtrls, Mask, ExtCtrls, OracleNavigator,
  Buttons, ActnList;

type
  TFCartaCorrecaoEletronica = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DsCCe: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DsCCeEvento: TDataSource;
    DBText2: TDBText;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    btAnt: TSpeedButton;
    btProx: TSpeedButton;
    btIncluir: TSpeedButton;
    btAlterar: TSpeedButton;
    btSalvar: TSpeedButton;
    btCancelar: TSpeedButton;
    btExcluir: TSpeedButton;
    BtEnviar: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    CBEmailXML: TCheckBox;
    CBEmailPDF: TCheckBox;
    BitBtn3: TBitBtn;
    SaveDialog1: TSaveDialog;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    LBTamanho: TLabel;
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
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
  private
    { Private declarations }
    fNota : Integer;
    fIdLote: Double;
    fChaveAcesso: String;
    procedure GerenciaBotoes(modo: integer);
  public
    { Public declarations }
    Property pCodNota : Integer Read fNota Write fNota;
    Property pIdLote : Double Read fIdLote Write fIdLote;
    Property pChaveAcesso : String Read fChaveAcesso Write fChaveAcesso;
  end;

var
  FCartaCorrecaoEletronica: TFCartaCorrecaoEletronica;

implementation

uses UCartaCorrecaoEletronica_cl, DateUtils, UOracle_cl, Math, UNfe_cl,
  StrUtils, UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFCartaCorrecaoEletronica.btAntClick(Sender: TObject);
begin
  DsCCeEvento.DataSet.Prior;
end;

procedure TFCartaCorrecaoEletronica.btProxClick(Sender: TObject);
begin
  DsCCeEvento.DataSet.Next;
end;

procedure TFCartaCorrecaoEletronica.btIncluirClick(Sender: TObject);
var
  nSeq: Integer;
begin
  with DMCartaCorrecaoEletronica do
  begin
    if QCartaCorrecaoEletronica_Item.RecordCount > 0 then
    begin
      QCartaCorrecaoEletronica_Item.Refresh;
      QCartaCorrecaoEletronica_Item.Last;
      nSeq := QCartaCorrecaoEletronica_ItemNSEQ_EVENTO.Value+1;
      if QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      begin
        QCartaCorrecaoEletronica_Item.Insert;
        QCartaCorrecaoEletronica_ItemNSEQ_EVENTO.Value := nSeq;
        QCartaCorrecaoEletronica_ItemID_LOTE.Value := QCartaCorrecaoEletronicaID_LOTE.Value;
        QCartaCorrecaoEletronica_ItemID_EVENTO.Value := 'ID110110' + fChaveAcesso + IfThen(length(IntToStr(nSeq))= 1,'0','') + IntToStr(nSeq);
        QCartaCorrecaoEletronica_ItemDT_EVENTO.Value := Now;
        GerenciaBotoes(1);
      end
      else
        MessageDlg('Antes de criar uma nova correção, envie a correção que está pendente.', mtError, [mbOK], 0);
    end
    else
    begin
      QCartaCorrecaoEletronica_Item.Insert;
      QCartaCorrecaoEletronica_ItemNSEQ_EVENTO.Value := 1;
      QCartaCorrecaoEletronica_ItemID_LOTE.Value := QCartaCorrecaoEletronicaID_LOTE.Value;
      QCartaCorrecaoEletronica_ItemID_EVENTO.Value := 'ID110110' + fChaveAcesso + '01';
      QCartaCorrecaoEletronica_ItemDT_EVENTO.Value := Now;
      GerenciaBotoes(1);
    end;
  end;
end;

procedure TFCartaCorrecaoEletronica.btAlterarClick(Sender: TObject);
begin
  with DMCartaCorrecaoEletronica do
  begin
    if QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('Esta correção já foi enviada e autorizada pela Sefaz. Não é possível alterá-la.', mtError, [mbOK], 0)
    else
    begin
      QCartaCorrecaoEletronica_Item.Edit;
      GerenciaBotoes(1);
    end;
  end;
end;

procedure TFCartaCorrecaoEletronica.btSalvarClick(Sender: TObject);
begin
  if (DsCCeEvento.State = dsEdit) or (DsCCeEvento.State = dsInsert) then
  begin
    if Trim(DBMemo1.Text) = '' then
    begin
      MessageDlg('Insira algum texto no campo "Correções".', mtError, [mbOK], 0);
      Abort;
    end;
    if Length(Trim(DBMemo1.Text)) < 15 then
    begin
      MessageDlg('Escreva pelos menos 15 caracteres.', mtError, [mbOK], 0);
      Abort;
    end;
    DsCCeEvento.DataSet.Post;
    if DsCCeEvento.DataSet.RecordCount > 0 then
      GerenciaBotoes(2)
    else
      GerenciaBotoes(3);
  end
  else
  begin
    DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_item.Refresh;
    DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_item.Last;
  end;
end;

procedure TFCartaCorrecaoEletronica.btCancelarClick(Sender: TObject);
begin
  DsCCeEvento.DataSet.Cancel;
  if DsCCeEvento.DataSet.RecordCount > 0 then
    GerenciaBotoes(2)
  else
    GerenciaBotoes(3);
end;

procedure TFCartaCorrecaoEletronica.btExcluirClick(Sender: TObject);
begin
  with DMCartaCorrecaoEletronica do
  begin
    if QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('Esta correção já foi enviada e autorizada pela Sefaz. Não é possível excluí-la.', mtError, [mbOK], 0)
    else if MessageDlg('Apagar esta correção?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        QCartaCorrecaoEletronica_Item.Delete;
  end;
  if DsCCeEvento.DataSet.RecordCount > 0 then
    GerenciaBotoes(2)
  else
    GerenciaBotoes(3);
end;

procedure TFCartaCorrecaoEletronica.GerenciaBotoes(modo: integer);
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

procedure TFCartaCorrecaoEletronica.BtEnviarClick(Sender: TObject);
begin
  btSalvarClick(self);
  with DMCartaCorrecaoEletronica do
  begin
    if QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('A correção já foi enviada e autorizada pela Sefaz. Crie uma nova correção e tente o envio.', mtError, [mbOK], 0)
    else
    begin
      DMNfe.EmiteCCe(fNota);
      DsCCeEvento.DataSet.Refresh;
      DsCCeEvento.DataSet.Last;
    end;
  end;
end;

procedure TFCartaCorrecaoEletronica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_Item.Cancel;
  DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica.Cancel;
end;

procedure TFCartaCorrecaoEletronica.FormActivate(Sender: TObject);
begin
  with DMCartaCorrecaoEletronica do
  begin
    QCartaCorrecaoEletronica.Close;
    QCartaCorrecaoEletronica.SetVariable('ID_LOTE',fIdLote);
    QCartaCorrecaoEletronica.Open;
    QCartaCorrecaoEletronica_Item.Close;
    QCartaCorrecaoEletronica_Item.Open;
    if fIdLote = 0 then
    begin
      QCartaCorrecaoEletronica.Insert;
      QCartaCorrecaoEletronicaDESC_CHAVE_ACESSO.Value := fChaveAcesso;
      QCartaCorrecaoEletronica.Post;
    end;
    
    if QCartaCorrecaoEletronica_Item.RecordCount = 0 then
      btIncluirClick(Self)
    else
    begin
      QCartaCorrecaoEletronica_Item.Last;
      if QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value = '135' then
        GerenciaBotoes(2)
      else
      begin
        QCartaCorrecaoEletronica_Item.Edit;
        GerenciaBotoes(1);
      end;
    end;
  end;
  DBMemo1Change(Self);
end;

procedure TFCartaCorrecaoEletronica.BitBtn3Click(Sender: TObject);
begin
  if DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value <> '135' then
  begin
      MessageDlg('Existe uma correção pendente. Para enviar o email, envie a correção ou exclua-a.', mtError, [mbOK], 0);
      Abort;
  end;
  DMNfe.EnviarEmailCCe(fNota, CBEmailXML.Checked, CBEmailPDF.Checked );
end;

procedure TFCartaCorrecaoEletronica.BitBtn2Click(Sender: TObject);
var
  Xml: TStringList;
begin
  DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_Item.Last;
  if DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value <> '135' then
  begin
      MessageDlg('Existe uma correção pendente. Para enviar o email, envie a correção ou exclua-a.', mtError, [mbOK], 0);
      Abort;
  end;
  SaveDialog1.FileName := 'CC-e_'+ fChaveAcesso;
  if(SaveDialog1.Execute) then
  begin
    if(SaveDialog1.FilterIndex = 2) then
    begin
      XML := TStringList.Create;
      XML.Add(DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_ItemDESC_XML_CCE.Value);
      XML.SaveToFile(SaveDialog1.FileName + '.xml');
    end
    else
      DMNfe.SalvarCCePdf(fNota,SaveDialog1.FileName+'.pdf');
  end;
end;

procedure TFCartaCorrecaoEletronica.BitBtn1Click(Sender: TObject);
begin
  DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_Item.Last;
  if DMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Value <> '135' then
  begin
      MessageDlg('Existe uma correção pendente. Para enviar o email, envie a correção ou exclua-a.', mtError, [mbOK], 0);
      Abort;
  end;
  DMNfe.ImprimeCCe(fNota);
end;

procedure TFCartaCorrecaoEletronica.FormCreate(Sender: TObject);
begin
  if DMCartaCorrecaoEletronica = nil then
    DMCartaCorrecaoEletronica := TDMCartaCorrecaoEletronica.Create(Application);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFCartaCorrecaoEletronica.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFCartaCorrecaoEletronica.DBMemo1Change(Sender: TObject);
begin
  LBTamanho.Caption := IntToStr(length(Trim(DBMemo1.Text)));
end;

end.
