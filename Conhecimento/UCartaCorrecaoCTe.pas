unit UCartaCorrecaoCTe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBCtrls, StdCtrls, Mask, ExtCtrls, OracleNavigator,
  Buttons, ActnList, Grids, DBGrids;

type
  TFCartaCorrecaoCTe = class(TForm)
    DsCartaCorrecaoCTe: TDataSource;
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
    DsCampoAlterado: TDataSource;
    GroupBox2: TGroupBox;
    btAnt: TSpeedButton;
    btProx: TSpeedButton;
    btIncluir: TSpeedButton;
    btAlterar: TSpeedButton;
    btSalvar: TSpeedButton;
    btCancelar: TSpeedButton;
    btExcluir: TSpeedButton;
    DBText2: TDBText;
    DsCorrecaoCTe: TDataSource;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    DsGrupoAlterado: TDataSource;
    DBNavigator1: TDBNavigator;
    DBComboBox1: TDBComboBox;
    Label5: TLabel;
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
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DsCartaCorrecaoCTeStateChange(Sender: TObject);
  private
    { Private declarations }
    fCTe : Integer;
    fChaveAcesso: String;
    procedure GerenciaBotoes(modo: integer);
  public
    { Public declarations }
    Property pCTe : Integer Read fCTe Write fCTe;
    Property pChaveAcesso : String Read fChaveAcesso Write fChaveAcesso;
  end;

var
  FCartaCorrecaoCTe: TFCartaCorrecaoCTe;

implementation

uses DateUtils, UOracle_cl, Math, UNfe_cl,
  StrUtils, UParamSistema_cl, UImpressoraFiscal, UCartaCorrecaoCTe_cl,
  UBiblioteca;

{$R *.dfm}

procedure TFCartaCorrecaoCTe.btAntClick(Sender: TObject);
begin
  DsCartaCorrecaoCTe.DataSet.Prior;
end;

procedure TFCartaCorrecaoCTe.btProxClick(Sender: TObject);
begin
  DsCartaCorrecaoCTe.DataSet.Next;
end;

procedure TFCartaCorrecaoCTe.btIncluirClick(Sender: TObject);
var
  nSeq: Integer;
begin
  with DMCartaCorrecaoCTe do
  begin
    if QCartaCorrecaoCTe.RecordCount > 0 then
    begin
      QCartaCorrecaoCTe.Refresh;
      QCartaCorrecaoCTe.Last;
      nSeq := QCartaCorrecaoCTeNSEQ_EVENTO.Value+1;
      if QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      begin
        QCartaCorrecaoCTe.Insert;
        QCartaCorrecaoCTeNSEQ_EVENTO.Value := nSeq;
        QCartaCorrecaoCTeID_EVENTO.Value := 'ID' +
            IntToStr(TP_EVENTO_DFE_CARTA_CORRECAO) +
            fChaveAcesso +
            Bib.ift(nSeq > 99, '',
            Bib.ift(nSeq > 9, '0','00')) + IntToStr(nSeq);
        QCartaCorrecaoCTeDT_EVENTO.Value := Now;
        QCartaCorrecaoCTeDESC_CHAVE_ACESSO.Value := pChaveAcesso;
        QCartaCorrecaoCTeTP_EVENTO.Value := TP_EVENTO_DFE_CARTA_CORRECAO;
        GerenciaBotoes(1);
      end
      else
        MessageDlg('Antes de criar uma nova carta de correção, envie a correção que está pendente.', mtError, [mbOK], 0);
    end
    else
    begin
      QCartaCorrecaoCTe.Insert;
      QCartaCorrecaoCTeNSEQ_EVENTO.Value := 1;
      QCartaCorrecaoCTeID_EVENTO.Value := 'ID110110' + fChaveAcesso + '001';
      QCartaCorrecaoCTeDT_EVENTO.Value := Now;
      QCartaCorrecaoCTeDESC_CHAVE_ACESSO.Value := pChaveAcesso;
      QCartaCorrecaoCTeTP_EVENTO.Value := TP_EVENTO_DFE_CARTA_CORRECAO;
      GerenciaBotoes(1);
    end;
  end;
end;

procedure TFCartaCorrecaoCTe.btAlterarClick(Sender: TObject);
begin
  with DMCartaCorrecaoCTe do
  begin
    if QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('Esta carta de correção já foi enviada e autorizada pela Sefaz. Não é possível alterá-la.', mtError, [mbOK], 0)
    else
    begin
      QCartaCorrecaoCTe.Edit;
      GerenciaBotoes(1);
    end;
  end;
end;

procedure TFCartaCorrecaoCTe.btSalvarClick(Sender: TObject);
begin
  if DsCartaCorrecaoCTe.DataSet.State in [dsInsert, dsEdit] then
  begin
    DsCartaCorrecaoCTe.DataSet.Post;
    if DsCorrecaoCTe.DataSet.State in [dsInsert, dsEdit] then
      DsCorrecaoCTe.DataSet.Post;
    DMOracle.DBCemapa.Commit;
    if DsCartaCorrecaoCTe.DataSet.RecordCount > 0 then
      GerenciaBotoes(2)
    else
      GerenciaBotoes(3);
  end
  else
  begin
    DMCartaCorrecaoCTe.QCartaCorrecaoCTe.Refresh;
    DMCartaCorrecaoCTe.QCartaCorrecaoCTe.Last;
  end;
end;

procedure TFCartaCorrecaoCTe.btCancelarClick(Sender: TObject);
begin
  DsCorrecaoCTe.DataSet.Cancel;
  DsCartaCorrecaoCTe.DataSet.Cancel;
  if DsCartaCorrecaoCTe.DataSet.RecordCount > 0 then
    GerenciaBotoes(2)
  else
    GerenciaBotoes(3);
end;

procedure TFCartaCorrecaoCTe.btExcluirClick(Sender: TObject);
begin
  with DMCartaCorrecaoCTe do
  begin
    if QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('Esta carta de correção já foi enviada e autorizada pela Sefaz. Não é possível excluí-la.', mtError, [mbOK], 0)
    else if MessageDlg('Apagar esta carta de correção?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      QCorrecaoCTe.First;
      while not QCorrecaoCTe.Eof do
        QCorrecaoCTe.Delete;

      QCartaCorrecaoCTe.Delete;
    end;
  end;
  if DsCartaCorrecaoCTe.DataSet.RecordCount > 0 then
    GerenciaBotoes(2)
  else
    GerenciaBotoes(3);
end;

procedure TFCartaCorrecaoCTe.GerenciaBotoes(modo: integer);
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

procedure TFCartaCorrecaoCTe.BtEnviarClick(Sender: TObject);
begin
  btSalvarClick(self);
  with DMCartaCorrecaoCTe do
  begin
    if QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value = '135' then
      MessageDlg('A carta de correção já foi enviada e autorizada pela Sefaz. Crie uma nova correção e tente o envio.', mtError, [mbOK], 0)
    else
    begin
      DMNfe.RegistraEventoCTe(fCTe, TP_EVENTO_DFE_CARTA_CORRECAO);
      DsCartaCorrecaoCTe.DataSet.Refresh;
      DsCartaCorrecaoCTe.DataSet.Last;
    end;
  end;
end;

procedure TFCartaCorrecaoCTe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMCartaCorrecaoCTe.QCorrecaoCTe.Cancel;
  DMCartaCorrecaoCTe.QCartaCorrecaoCTe.Cancel;

  DMCartaCorrecaoCTe.QCampoAlterado.Close;
  DMCartaCorrecaoCTe.QGrupoAlterado.Close;
end;

procedure TFCartaCorrecaoCTe.FormActivate(Sender: TObject);
begin
  with DMCartaCorrecaoCTe do
  begin
    QCartaCorrecaoCTe.Close;
    QCartaCorrecaoCTe.SetVariable('DESC_CHAVE_ACESSO', fChaveAcesso);
    QCartaCorrecaoCTe.Open;

    QGrupoAlterado.Open;
    QCampoAlterado.Open;
    
    QCorrecaoCTe.Close;
    QCorrecaoCTe.Open;
    
    if QCartaCorrecaoCTe.RecordCount = 0 then
      btIncluirClick(Self)
    else
    begin
      QCartaCorrecaoCTe.Last;
      if QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value = '135' then
        GerenciaBotoes(2)
      else
      begin
        QCartaCorrecaoCTe.Edit;
        GerenciaBotoes(1);
      end;
    end;
  end;
end;

procedure TFCartaCorrecaoCTe.BitBtn3Click(Sender: TObject);
begin
  if DMCartaCorrecaoCTe.QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value <> '135' then
  begin
      MessageDlg('Existe uma carta de correção pendente. Para enviar o email, envie a carta de correção ou exclua-a.', mtError, [mbOK], 0);
      Abort;
  end;
  DMNfe.EnviarEmailCCeCTe( fCTe, CBEmailXML.Checked, CBEmailPDF.Checked );
end;

procedure TFCartaCorrecaoCTe.BitBtn2Click(Sender: TObject);
var
  Xml: TStringList;
begin
  DMCartaCorrecaoCTe.QCartaCorrecaoCTe.Last;
  if DMCartaCorrecaoCTe.QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value <> '135' then
  begin
      MessageDlg('Existe uma carta de correção pendente. Para enviar o email, envie a carta de correção ou exclua-a.', mtError, [mbOK], 0);
      Abort;
  end;
  SaveDialog1.FileName := 'CC-e_'+ fChaveAcesso;
  if(SaveDialog1.Execute) then
  begin
    if(SaveDialog1.FilterIndex = 2) then
    begin
      XML := TStringList.Create;
      XML.Add(DMCartaCorrecaoCTe.QCartaCorrecaoCTeDESC_XML_EVENTO.Value);
      XML.SaveToFile(SaveDialog1.FileName + '.xml');
    end
    else
      DMNfe.SalvarCCeCTePdf(fCTe,SaveDialog1.FileName+'.pdf');
  end;
end;

procedure TFCartaCorrecaoCTe.BitBtn1Click(Sender: TObject);
begin
  DMCartaCorrecaoCTe.QCartaCorrecaoCTe.Last;
  if DMCartaCorrecaoCTe.QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value <> '135' then
  begin
      MessageDlg('Existe uma carta de correção pendente. Para enviar o email, envie a carta de correção ou exclua-a.', mtError, [mbOK], 0);
      Abort;
  end;
  DMNfe.ImprimeCCeCTe(fCTe);
end;

procedure TFCartaCorrecaoCTe.FormCreate(Sender: TObject);
begin
  if DMCartaCorrecaoCTe = nil then
    DMCartaCorrecaoCTe := TDMCartaCorrecaoCTe.Create(Application);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFCartaCorrecaoCTe.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFCartaCorrecaoCTe.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if DsCorrecaoCTe.DataSet.State = dsInsert then
    DBLookupComboBox2.SetFocus;
end;

procedure TFCartaCorrecaoCTe.DsCartaCorrecaoCTeStateChange(
  Sender: TObject);
begin
  GroupBox1.Enabled := DsCartaCorrecaoCTe.State in [dsEdit, dsInsert];
end;

end.                                              
