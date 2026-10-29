unit UOrdemCarregamentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus, ActnList, ComCtrls;

type
  TFOrdemCarregamentoCons = class(TFTConsulta)
    MeCodOrigem: TMaskEdit;
    MECodDestino: TMaskEdit;
    SBOrigemCons: TSpeedButton;
    SBDestinoCons: TSpeedButton;
    EdDestino: TEdit;
    Label2: TLabel;
    GB12DtEmissao: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    MEDt_Inicial: TMaskEdit;
    MEDt_Final: TMaskEdit;
    EdOrigem: TEdit;
    Label3: TLabel;
    SbFilialCons: TSpeedButton;
    MeCodFilial: TMaskEdit;
    EdFilial: TEdit;
    Label5: TLabel;
    SbMotoristaCons: TSpeedButton;
    MeCodMotorista: TMaskEdit;
    EdMotorista: TEdit;
    RgSituacao: TRadioGroup;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure MeCodOrigemExit(Sender: TObject);
    procedure MECodDestinoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MeCodFilialExit(Sender: TObject);
    procedure MeCodMotoristaExit(Sender: TObject);
    procedure SBDestinoConsClick(Sender: TObject);
    procedure SbFilialConsClick(Sender: TObject);
    procedure SBOrigemConsClick(Sender: TObject);
    procedure SbMotoristaConsClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemCarregamentoCons: TFOrdemCarregamentoCons;

implementation

uses UOrdemCarregamento_cl, UUsuario_cl, UOracle_cl, UFilialCons,
  UFilial_cl, UCadastroCons, UCadastro_cl, UParamSistema_cl,
  UImpressoraFiscal;

{$R *.DFM}

procedure TFOrdemCarregamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'CONHECIMENTO');
  If(Trim(MEDt_Final.Text)='')OR(Trim(MEDt_Inicial.Text)='')Then
    raise Exception.Create('É necessário informar um Período');
  With DMOrdemCarregamento do
  Begin
    QOrdemCarregamentoCons.Close;
    If(Trim(MeCodOrigem.Text)<>'')Then
      QOrdemCarregamentoCons.SetVariable('ORIGEM',Trim(MeCodOrigem.Text))
    Else
      QOrdemCarregamentoCons.SetVariable('ORIGEM',null);

    If(Trim(MeCodDestino.Text)<>'')Then
      QOrdemCarregamentoCons.SetVariable('DESTINO',Trim(MeCodDestino.Text))
    Else
      QOrdemCarregamentoCons.SetVariable('DESTINO',null);

    If(Trim(MeCodMotorista.Text)<>'')Then
      QOrdemCarregamentoCons.SetVariable('MOTORISTA',Trim(MeCodMotorista.Text))
    Else
      QOrdemCarregamentoCons.SetVariable('MOTORISTA',null);

    If(Trim(MeCodFilial.Text)<>'')Then
      QOrdemCarregamentoCons.SetVariable('FILIAL',Trim(MeCodFilial.Text))
    Else
      QOrdemCarregamentoCons.SetVariable('FILIAL',null);

    Case RgSituacao.ItemIndex Of
      0: QOrdemCarregamentoCons.SetVariable('SITUACAO','A');
      1: QOrdemCarregamentoCons.SetVariable('SITUACAO','B');
      2: QOrdemCarregamentoCons.SetVariable('SITUACAO','C');
    End;

    QOrdemCarregamentoCons.SetVariable('DT_EMISSAO_INICIAL',Trim(MEDt_Inicial.Text));
    QOrdemCarregamentoCons.SetVariable('DT_EMISSAO_FINAL',Trim(MEDt_Final.Text));
    QOrdemCarregamentoCons.Open;
  End
end;

procedure TFOrdemCarregamentoCons.MeCodOrigemExit(Sender: TObject);
begin
  inherited;
  If(Trim(MeCodOrigem.Text) <> '')Then
    EdOrigem.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + Trim(MeCodOrigem.Text))
  Else
    EdOrigem.Text := 'Todas';
end;

procedure TFOrdemCarregamentoCons.MECodDestinoExit(Sender: TObject);
begin
  inherited;
  If(Trim(MeCodDestino.Text) <> '')Then
    EdDestino.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + Trim(MeCodDestino.Text))
  Else
    EdDestino.Text := 'Todos';
end;

procedure TFOrdemCarregamentoCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDt_Inicial.Text := DateToStr(Date);//'01/' + FormatDateTime('MM/YYYY',Date);
  MEDt_Final.Text := DateToStr(Date);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFOrdemCarregamentoCons.MeCodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(MeCodFilial.Text) <> '')Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL =' + Trim(MeCodFilial.Text))
  Else
    EdFilial.Text := 'Todas';
end;

procedure TFOrdemCarregamentoCons.MeCodMotoristaExit(Sender: TObject);
begin
  inherited;
  If(Trim(MeCodMotorista.Text) <> '')Then
    EdMotorista.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + Trim(MeCodMotorista.Text))
  Else
    EdMotorista.Text := 'Todos';
end;

procedure TFOrdemCarregamentoCons.SBDestinoConsClick(Sender: TObject);
begin
  inherited;
  If(FCadastroCons = nil)Then
    FCadastroCons := TFCadastroCons.Create(Application);
  If(FCadastroCons.Showmodal = mrOk)Then
  Begin
    MeCodDestino.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    EdDestino.Text := DMCadastro.QCadastroConsNOME.Text;
  End;
end;

procedure TFOrdemCarregamentoCons.SbFilialConsClick(Sender: TObject);
begin
  inherited;
  If(FFilialCons = nil)Then
    FFilialCons := TFFilialCons.Create(Application);
  If(FFilialCons.Showmodal = mrOk)Then
  Begin
    MeCodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    EdFilial.Text := DMFilial.QFilialConsDESC_FILIAL.Text;
  End;
end;

procedure TFOrdemCarregamentoCons.SBOrigemConsClick(Sender: TObject);
begin
  inherited;
  If(FCadastroCons = nil)Then
    FCadastroCons := TFCadastroCons.Create(Application);
  If(FCadastroCons.Showmodal = mrOk)Then
  Begin
    MeCodOrigem.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    EdOrigem.Text := DMCadastro.QCadastroConsNOME.Text;
  End;
end;

procedure TFOrdemCarregamentoCons.SbMotoristaConsClick(Sender: TObject);
begin
  inherited;
  If(FCadastroCons = nil)Then
    FCadastroCons := TFCadastroCons.Create(Application);
  If(FCadastroCons.Showmodal = mrOk)Then
  Begin
    MeCodMotorista.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    EdMotorista.Text := DMCadastro.QCadastroConsNOME.Text;
  End;
end;

procedure TFOrdemCarregamentoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
