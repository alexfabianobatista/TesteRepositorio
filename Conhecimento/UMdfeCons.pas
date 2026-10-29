unit UMdfeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, variants, UFmFilial, UFmCadastro, Menus;

type
  TFMdfeCons = class(TFTConsulta)
    RgSituacao: TRadioGroup;
    FmFilialCons: TFmFilial;
    Label3: TLabel;
    Label11: TLabel;
    MEDTini: TMaskEdit;
    MeDtFim: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMdfeCons: TFMdfeCons;

implementation

uses UFilialCons, UFilial_cl, UUsuario_cl, UManifesto_cl;

{$R *.DFM}

procedure TFMdfeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMManifesto.QManifestoCons.close;
  DMManifesto.QManifestoCons.ClearVariables;
  DmUsuario.Checar_Filial_Usuario( Trim(FmFilialCons.MeFilial.Text),'CONHECIMENTO');
  with DMManifesto do
  Begin
    if Trim(METexto.text) = '' then
      QManifestoCons.SetVariable('NUM_MANIFESTO', NULL)
    else
      QManifestoCons.SetVariable('NUM_MANIFESTO',METexto.Text);
    if trim(MeDtIni.text) = '' then
      QManifestoCons.SetVariable('DT_EMISSAO_INI', NULL)
    else
      QManifestoCons.SetVariable('DT_EMISSAO_INI', MeDtIni.text);
      
    if trim(MeDtFim.text) = '' then
      QManifestoCons.SetVariable('DT_EMISSAO_FIM', NULL)
    else
      QManifestoCons.SetVariable('DT_EMISSAO_FIM', MeDtFim.text);

    if Trim(FmFilialCons.MeFilial.Text) = '' then
      QManifestoCons.SetVariable('COD_FILIAL', NULL)
    else
      QManifestoCons.SetVariable('COD_FILIAL',Trim(FmFilialCons.MeFilial.Text)); 

    Case RgSituacao.ItemIndex Of
      0 : QManifestoCons.SetVariable('Situacao','1');
      1 : QManifestoCons.SetVariable('Situacao','2');
      2 : QManifestoCons.SetVariable('Situacao','3');
      3 : QManifestoCons.SetVariable('Situacao',Null);
    End;  
    DMManifesto.QManifestoCons.open;
  end;
end;

procedure TFMdfeCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEDTini.Text := DateToStr(Date);
  MeDtFim.Text := DateToStr(Date);
end;

end.
