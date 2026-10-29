unit UContratoObra_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFObraContrato_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ME0DtInicio: TMaskEdit;
    ME0DtFim: TMaskEdit;
    Label1: TLabel;
    Me0Filial: TMaskEdit;
    Bt0Filial: TBitBtn;
    Ed0Filial: TEdit;
    Label101: TLabel;
    ME0Obra: TMaskEdit;
    Bt0Obra: TSpeedButton;
    Ed0Obra: TMaskEdit;
    Label4: TLabel;
    ME0Contrato: TMaskEdit;
    BT0Contrato: TBitBtn;
    Label5: TLabel;
    ME0Cadastro: TMaskEdit;
    BT0Cadastro: TBitBtn;
    ED0Cadastro: TEdit;
    Rg1Tipo: TRadioGroup;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Me1Cadastro: TMaskEdit;
    Bt1Cadastro: TBitBtn;
    Ed1Cadastro: TEdit;
    Label7: TLabel;
    Me1Obra: TMaskEdit;
    Bt1Obra: TSpeedButton;
    Ed1Obra: TMaskEdit;
    Label8: TLabel;
    Me1Filial: TMaskEdit;
    BtFilial: TBitBtn;
    Ed1Filial: TEdit;
    procedure Bt0FilialClick(Sender: TObject);
    procedure Me0FilialExit(Sender: TObject);
    procedure Bt0ObraClick(Sender: TObject);
    procedure ME0ObraExit(Sender: TObject);
    procedure BT0CadastroClick(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure BT0ContratoClick(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure Bt1CadastroClick(Sender: TObject);
    procedure Me1ObraExit(Sender: TObject);
    procedure Bt1ObraClick(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraContrato_Param: TFObraContrato_Param;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UObraContrato_Cons,
  UObraContrato_cl, UCadastroCons, UCadastro_cl, UObraCons, UObra_cl;

{$R *.DFM}

procedure TFObraContrato_Param.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me0FilialExit(Self);
  End;
end;

procedure TFObraContrato_Param.Me0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                         'COD_Filial = '+Trim(ME0Filial .Text))
  Else
    Ed0Filial.Text := 'Todas';
end;

procedure TFObraContrato_Param.Bt0ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal=mrOk Then
  begin
    With DMObra do
    Begin
      ME0Obra.Text := IntToStr(QObra_ConsCod_Obra.Value);
      ME0ObraExit(Self);
      QObra_Cons.Close;
    End;
  End;
end;

procedure TFObraContrato_Param.ME0ObraExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Obra.Text) <> '' Then
    Ed0Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                       'COD_OBRA = '+Trim(ME0Obra .Text))
  Else
    Ed0Obra.Text := 'Todas';
end;

procedure TFObraContrato_Param.BT0CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    begin
      ME0Cadastro.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      ME0CadastroExit(Self);
      DMCadastro.QCadastroCons.Close;
    End;
end;

procedure TFObraContrato_Param.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cadastro.Text) <> '' Then
    ED0Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME0Cadastro .Text))
  Else
    ED0Cadastro.Text := 'Todos';
end;

procedure TFObraContrato_Param.BT0ContratoClick(Sender: TObject);
begin
  inherited;
  If FObraContrato_Cons = Nil then
    FObraContrato_Cons := TFObraContrato_Cons.Create(Application);
  If FObraContrato_Cons.ShowModal = mrOk then
  With DMObraContrato do
  Begin
    ME0Contrato.Text := QObraContrato_ConsNUM_CONTRATO.Value;
    QObraContrato_Cons.Close;
  end;
end;

procedure TFObraContrato_Param.Me1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Cadastro.Text) <> '' Then
    Ed1Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(Me1Cadastro .Text))
  Else
    Ed1Cadastro.Text := 'Todos';

end;

procedure TFObraContrato_Param.Bt1CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    begin
      Me1Cadastro.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Me1CadastroExit(Self);
      DMCadastro.QCadastroCons.Close;
    End;

end;

procedure TFObraContrato_Param.Me1ObraExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Obra.Text) <> '' Then
    Ed1Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                       'COD_OBRA = '+Trim(Me1Obra .Text))
  Else
    Ed1Obra.Text := 'Todas';

end;

procedure TFObraContrato_Param.Bt1ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal=mrOk Then
  begin
    With DMObra do
    Begin
      Me1Obra.Text := IntToStr(QObra_ConsCod_Obra.Value);
      Me1ObraExit(Self);
      QObra_Cons.Close;
    End;
  End;

end;

procedure TFObraContrato_Param.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Filial.Text) <> '' Then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                         'COD_Filial = '+Trim(Me1Filial .Text))
  Else
    Ed1Filial.Text := 'Todas';

end;

procedure TFObraContrato_Param.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me1FilialExit(Self);
  End;

end;

end.
