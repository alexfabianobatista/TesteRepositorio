unit UConhecimentoFretecons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFConhecimentoFreteCons = class(TFTConsulta)
    SpeedButton32: TSpeedButton;
    Label56: TLabel;
    MeCodFilial: TMaskEdit;
    MeFilial: TMaskEdit;
    Label2: TLabel;
    MeCodCadastro: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MeCadastro: TMaskEdit;
    MeDtEmissao: TMaskEdit;
    Label3: TLabel;
    RgSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure MeCodFilialExit(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure MeCodCadastroExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoFreteCons: TFConhecimentoFreteCons;

implementation

uses UConhecimentoFrete_cl, Ucontrato_cl, UContratoVenda_Cons, UFilialCons,
  UFilial_cl, UOracle_cl, UCadastroCons, UCadastro_cl, UUsuario_cl;

{$R *.DFM}

procedure TFConhecimentoFreteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'AGRICOLA');
  with DMConhecimentoFrete do
    begin
      QConhecimentoFreteCons.Close;
      If Trim(MeCodFilial.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_FILIAL',StrToInt(Trim(MeCodFilial.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_FILIAL',Null);

      If Trim(MeCodCadastro.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_CADASTRO',StrToInt(Trim(MeCodCadastro.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_CADASTRO',Null);

      If Trim(MeTexto.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('NUM_FRETE',StrToInt(Trim(MeTexto.Text)))
      else
         QConhecimentoFreteCons.SetVariable('NUM_FRETE',Null);
      QConhecimentoFreteCons.SetVariable('DT_EMISSAO',StrToDate(MeDtEmissao.Text));
      Case RgSituacao.ItemIndex of
        0 : QConhecimentoFreteCons.SetVariable('SITUACAO','2');
        1 : QConhecimentoFreteCons.SetVariable('SITUACAO','1');
        2 : QConhecimentoFreteCons.SetVariable('SITUACAO',Null);
      End;
      QConhecimentoFreteCons.Open;
    end;
end;

procedure TFConhecimentoFreteCons.MeCodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodFilial.Text)<>'' then
    MeFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MeCodFilial.Text)
  else
    MeFilial.Clear;

end;

procedure TFConhecimentoFreteCons.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MeCodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
      MeCodFilialExit(Self);
    end;

end;

procedure TFConhecimentoFreteCons.MeCodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodCadastro.Text)<>'' then
    MeCadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MeCodCadastro.Text)
  else
    MeCadastro.Clear;
end;

procedure TFConhecimentoFreteCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MeCodCadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      MeCodCadastroExit(Self);
    end;
end;

end.
