unit USuporteCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls, DateUtils;

type
  TFSuporteCons = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    MEAnalista: TMaskEdit;
    Label2: TLabel;
    BTAnalista: TBitBtn;
    MEModulo: TMaskEdit;
    Label3: TLabel;
    METela: TMaskEdit;
    Label4: TLabel;
    BTFuncao: TBitBtn;
    MEFuncao: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    Label7: TLabel;
    MEProblema: TMaskEdit;
    Label8: TLabel;
    CBTipoSuporte: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    MEFechamentoInicial: TMaskEdit;
    MEFechamentoFinal: TMaskEdit;
    Label11: TLabel;
    RGPrioridade: TRadioGroup;
    CBSituacao: TComboBox;
    Label12: TLabel;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure BTAnalistaClick(Sender: TObject);
    procedure BTFuncaoClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MEAnalistaChange(Sender: TObject);
    procedure MEModuloChange(Sender: TObject);
    procedure METelaChange(Sender: TObject);
    procedure MEFuncaoChange(Sender: TObject);
    procedure RGPrioridadeClick(Sender: TObject);
    procedure MEProblemaChange(Sender: TObject);
    procedure CBTipoSuporteChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuporteCons: TFSuporteCons;

implementation

uses USuporte_cl, UCadastroCons, UCadastro_cl, UUsuarioCons, UUsuario_cl,
  UFuncaoCons, UFuncao_cl;

{$R *.dfm}

procedure TFSuporteCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFSuporteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMSuporte do
  begin
    QSuporteCons.Close;
    if Trim(METexto.Text) <> '' then
      QSuporteCons.SetVariable('CADASTRO', trim(METexto.Text))
    else
      QSuporteCons.SetVariable('CADASTRO', null);

    if Trim(MEAnalista.Text) <> '' then
      QSuporteCons.SetVariable('USUARIO', trim(MEAnalista.Text))
    else
      QSuporteCons.SetVariable('USUARIO', null);

    if Trim(MEModulo.Text) <> '' then
      QSuporteCons.SetVariable('MODULO', trim(MEModulo.Text))
    else
      QSuporteCons.SetVariable('MODULO', null);

    if Trim(METela.Text) <> '' then
      QSuporteCons.SetVariable('TELA', trim(METela.Text))
    else
      QSuporteCons.SetVariable('TELA', null);

    if Trim(MEFuncao.Text) <> '' then
      QSuporteCons.SetVariable('FUNCAO', trim(MEFuncao.Text))
    else
      QSuporteCons.SetVariable('FUNCAO', null);

    if Trim(CBSituacao.Text) <> '' then
      QSuporteCons.SetVariable('SITUACAO', trim(CBSituacao.Text))
    else
      QSuporteCons.SetVariable('SITUACAO', null);

    if RGPrioridade.ItemIndex < 3 then
      QSuporteCons.SetVariable('PRIORIDADE', RGPrioridade.ItemIndex+1)
    else
      QSuporteCons.SetVariable('PRIORIDADE', null);

    if Trim(MEProblema.Text) <> '' then
      QSuporteCons.SetVariable('PROBLEMA', trim(MEProblema.Text))
    else
      QSuporteCons.SetVariable('PROBLEMA', null);

    if Trim(CBTipoSuporte.Text) <> '' then
      QSuporteCons.SetVariable('TIPO_SUPORTE', trim(CBTipoSuporte.Text))
    else
      QSuporteCons.SetVariable('TIPO_SUPORTE', null);

    if Trim(MEDtInicial.Text) <> '' then
      QSuporteCons.SetVariable('DT_ABERTURA_I',StrToDate(MEDtInicial.Text))
    else
      QSuporteCons.SetVariable('DT_ABERTURA_I',null);

    if Trim(MEDtFinal.Text) <> '' then
      QSuporteCons.SetVariable('DT_ABERTURA_F',StrToDate(MEDtFinal.Text))
    else
      QSuporteCons.SetVariable('DT_ABERTURA_F',null);

    if Trim(MEFechamentoInicial.Text) <> '' then
      QSuporteCons.SetVariable('DT_FECHAMENTO_I',StrToDate(MEFechamentoInicial.Text))
    else
      QSuporteCons.SetVariable('DT_FECHAMENTO_I',null);

    if Trim(MEFechamentoFinal.Text) <> '' then
      QSuporteCons.SetVariable('DT_FECHAMENTO_F',StrToDate(MEFechamentoFinal.Text))
    else
      QSuporteCons.SetVariable('DT_FECHAMENTO_F',null);
    QSuporteCons.Open;
  end;
end;

procedure TFSuporteCons.BTAnalistaClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = Nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
    MEAnalista.Text := DMUsuario.QUsuarioConsCod_USUARIO.Text;
end;

procedure TFSuporteCons.BTFuncaoClick(Sender: TObject);
begin
  inherited;
  If FFuncaoCons = Nil then
    FFuncaoCons := TFFuncaoCons.Create(Application);
  If FFuncaoCons.ShowModal = mrOk then
    MEFuncao.Text := DMFuncao.QFuncaoConsCOD_FUNCAO.Text;
end;

procedure TFSuporteCons.METextoChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.MEAnalistaChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.MEModuloChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.METelaChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.MEFuncaoChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.RGPrioridadeClick(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.MEProblemaChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.CBTipoSuporteChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFSuporteCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEDtInicial.Text := DateToStr(IncDay(Date,-90));
  MEDtFinal.Text := DateToStr(Date);
end;

end.
