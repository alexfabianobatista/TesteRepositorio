unit UOSMarcacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, ExtCtrls, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, Buttons, variants, DBPanel, ActnList;

type
  TFOFI0010 = class(TFTCadSimples)                                                  
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEHoraInicio: TDBEdit;
    Label7: TLabel;
    EdNomeCadastro: TEdit;
    Label6: TLabel;
    DBEHoraFim: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBPRequisicaoItem: TDBPanel;
    DBPOs: TDBPanel;
    DBPMecanico: TDBPanel;
    MEHoraInicio: TMaskEdit;
    MEHoraFim: TMaskEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure DBPRequisicaoItemDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    procedure DBPRequisicaoItemBuscaClick(Sender: TObject);
    procedure DBPOsDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPOsCodigoChange(Sender: TObject);
    procedure DBPMecanicoDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    function DBPRequisicaoItemRenderizar(Sender: TObject): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure MEHoraInicioEnter(Sender: TObject);
    procedure MEHoraInicioExit(Sender: TObject);
  private
    procedure RefreshMaskEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0010: TFOFI0010;

implementation

uses UOficina_cl, UMecanicoCons, UOSCons, UMarcacaoCons, UOracle_cl,
  UComissao_cl, UComissaoCons, UParamSistema_cl, URequisicaoCons,
  UBiblioteca, UOs_cl;

{$R *.DFM}

procedure TFOFI0010.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMarcacaoCons = nil then
    FMarcacaoCons:= TFMarcacaoCons.Create(Application);
  if FMarcacaoCons.ShowModal = mrOk then
    with DMOficina do
    begin
      QOSMarcacao.Close;
      QOSMarcacao.SetVariable('PK',QOSMarcacaoConsCOD_MARCACAO.Value);
      QOSMarcacao.Open;
    end;
end;

procedure TFOFI0010.SBConfirmarClick(Sender: TObject);
var
  wAgronews: Bool;
begin
  wAgronews := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
  if wAgronews then
    DBPOs.SetFocus;
  if (DMOficina.QOSMarcacaoNUM_OS.Value = 0) or (DMOficina.QOSMarcacaoCOD_MECANICO.Value = 0) or
     (Trim(DBEdit4.Text) = '') or (Trim(DBEHoraInicio.Text) = '') then
    raise exception.Create('Registro em branco, verifique e tente novamente!');

  if DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+DMOficina.QOSMarcacaoCOD_MECANICO.Text) = '' then
    raise exception.Create('Mecanico informado não existe no cadastro!');

  // Verifica se mecanico já está marcado.
  if DMOficina.QOSMarcacaoCOD_MECANICO.Value > 0 then
  begin
    with DMOficina do
    begin
      QOSMarcacaoCons.Close;
      QOSMarcacaoCons.SetVariable('NUM_OS',Null);
      QOSMarcacaoCons.SetVariable('COD_MECANICO',DMOficina.QOSMarcacaoCOD_MECANICO.Text);
      QOSMarcacaoCons.SetVariable('IND_SITUACAO','I');
      QOSMarcacaoCons.Open;
      if (QOSMarcacaoCons.RecordCount > 0) and (QOSMarcacao.State = dsInsert)  then
        raise exception.Create('Mecanico já está MARCADO EM O.S.!');
    end;
  end;

  // Verifica se O.S. existe ou se ja esta fechada!
  if DMOficina.QOSMarcacaoNUM_OS.Text <> '' then
  begin
    with DMOs do
    begin
      QOSCons.Close;
      QOSCons.SetVariable('NUM_OS',DMOficina.QOSMarcacaoNUM_OS.Text);
      QOSCons.SetVariable('IND_SITUACAO','A');
      QOSCons.SetVariable('NUM_PLACA',Null);
      QOSCons.SetVariable('COD_CADASTRO',Null);
      QOSCons.Open;
      if QOSCons.RecordCount = 0 then
      begin
        DMOficina.QOSMarcacaoNUM_OS.Clear;
        raise exception.Create('Número O.S. informada não foi encontrada ou já está fechada!');
      end;
    end;
  end;

  if wAgronews then
    if (DMOficina.QOSMarcacaoDT_FIM.IsNull) then
      DMOficina.QOSMarcacaoIND_SITUACAO.Value := 'I'
    else
      DMOficina.QOSMarcacaoIND_SITUACAO.Value := 'F';

  inherited;
end;

procedure TFOFI0010.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
var mCod_Cadastro:String;
begin
  inherited;
  if DMOficina.QOSMarcacaoNUM_OS.Value <> 0 then
  begin
    mCod_cadastro:= DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_OS','NUM_OS = '+IntToStr(DMOficina.QOSMarcacaoNUM_OS.Value));
    EdNomeCadastro.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+mCod_Cadastro);
    RefreshMaskEdits;
  end;
end;

procedure TFOFI0010.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QOSMarcacao.Close;
    QOSMarcacao.Open;
  end;
end;

procedure TFOFI0010.DBPRequisicaoItemDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FOFI0016 = nil then
    FOFI0016 := TFOFI0016.Create(Application);
  FormConsulta := FOFI0016;
  QueryConsulta := DMOficina.QRequisicaoItensCons;
end;

procedure TFOFI0010.DBPRequisicaoItemBuscaClick(Sender: TObject);
begin
  inherited;
  FOFI0016.METexto.Text := DMOficina.QOSMarcacaoNUM_OS.Text;
  FOFI0016.BtProcurar.Click;
end;

procedure TFOFI0010.DBPOsDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  FormConsulta := FOsCons;
  QueryConsulta := DMOs.QOSCons;
end;

procedure TFOFI0010.DBPOsCodigoChange(Sender: TObject);
var
  wCadastro: String;
begin
  inherited;
  if DMOs.QOSCadNUM_OS.Value > 0 then
  begin
    wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_OS','NUM_OS = ' + DMOs.QOSCadNUM_OS.Text);
    if wCadastro <> '' then
      EdNomeCadastro.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + wCadastro);
  end;
end;

procedure TFOFI0010.DBPMecanicoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons:= TFMecanicoCons.Create(Application);
  FormConsulta := FMecanicoCons;
  QueryConsulta := DMOficina.QMecanicoCons;
end;

function TFOFI0010.DBPRequisicaoItemRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
end;

procedure TFOFI0010.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    Bib.inverteControles(DBEHoraInicio, MEHoraInicio, true, true, true, true);
    Bib.inverteControles(DBEHoraFim, MEHoraFim, true, true, true, true);
    MEHoraInicio.TabOrder := DBEHoraInicio.TabOrder;
    MEHoraFim.TabOrder := DBEHoraFim.TabOrder;
  end;
end;

procedure TFOFI0010.RefreshMaskEdits;
begin
  if DMOficina.QOSMarcacaoDT_INICIO.IsNull then
    MEHoraInicio.Text := '  :  '
  else
    MEHoraInicio.Text := FormatDateTime('hh:nn', DMOficina.QOSMarcacaoDT_INICIO.Value);
  if DMOficina.QOSMarcacaoDT_FIM.IsNull then
    MEHoraFim.Text := '  :  '
  else
    MEHoraFim.Text := FormatDateTime('hh:nn', DMOficina.QOSMarcacaoDT_FIM.Value);
end;

procedure TFOFI0010.MEHoraInicioEnter(Sender: TObject);
begin
  inherited;
  RefreshMaskEdits;
end;

procedure TFOFI0010.MEHoraInicioExit(Sender: TObject);
var
  me: TMaskEdit;
  f: TField;
begin
  inherited;
  if DSPrimario.State in [DsEdit, DsInsert] then
  begin
    me := Sender as TMaskEdit;
    if me = MEHoraInicio then
      f := DMOficina.QOSMarcacaoDT_INICIO
    else
      f := DMOficina.QOSMarcacaoDT_FIM;
    if Trim(me.Text) <> ':' then
    begin
      me.Text := StringReplace(me.Text, ' ', '0', [rfReplaceAll]);
      if (f.IsNull) or (FormatDateTime('hh:nn',f.Value) <> me.Text) then
        f.Value := StrToTime(me.Text + ':00');
    end
    else
      f.Value := null;
  end;
end;

end.
