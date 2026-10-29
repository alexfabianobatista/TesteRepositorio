unit UUsuarioFilialCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFUsuarioFilialCons = class(TFTConsulta)
    SBUsuario: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    SBModulo: TSpeedButton;
    Label13: TLabel;
    SBFilial: TSpeedButton;
    MEUsuario: TMaskEdit;
    EdUsuario: TEdit;
    MEModulo: TMaskEdit;
    EdModulo: TEdit;
    MEFilial: TMaskEdit;
    EdFilial: TEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBModuloClick(Sender: TObject);
    procedure SBUsuarioClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MEModuloChange(Sender: TObject);
    procedure MEUsuarioChange(Sender: TObject);
    procedure MEFilialChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarioFilialCons: TFUsuarioFilialCons;

implementation

uses UUsuario_cl, UOracle_cl, UModuloCons, UUsuarioCons, UFilialCons,
  UFuncao_cl, UFilial_cl;

{$R *.DFM}

procedure TFUsuarioFilialCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMUsuario do
  Begin
    QUsuarioFilialCons.Close;
    If Trim(MEModulo.Text) <> '' Then
      QUsuarioFilialCons.SetVariable('MODULO', Trim(MEModulo.Text) )
    Else
      QUsuarioFilialCons.SetVariable('MODULO', null );
    If Trim(MEUsuario.Text) <> '' Then
      QUsuarioFilialCons.SetVariable('USUARIO', Trim(MEUsuario.Text) )
    Else
      QUsuarioFilialCons.SetVariable('USUARIO', null );
    If Trim(MEFilial.Text) <> '' Then
      QUsuarioFilialCons.SetVariable('FILIAL', Trim(MEFilial.Text) )
    Else
      QUsuarioFilialCons.SetVariable('FILIAL', null );
    QUsuarioFilialCons.Open;
  End;
end;

procedure TFUsuarioFilialCons.SBModuloClick(Sender: TObject);
begin
  inherited;
  If FModuloCons = nil then
    FModuloCons := TFModuloCons.Create(Application);
  If FModuloCons.ShowModal = mrOk then
    MEModulo.Text := DMFuncao.QModuloConsCOD_MODULO.Text;
end;

procedure TFUsuarioFilialCons.SBUsuarioClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
    MEUsuario.Text := DMUsuario.QUsuarioConsCOD_USUARIO.Text;
end;

procedure TFUsuarioFilialCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFUsuarioFilialCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FUsuarioFilialCons := nil;
end;

procedure TFUsuarioFilialCons.MEModuloChange(Sender: TObject);
begin
  inherited;
  With DMUsuario do
    If Trim(MEModulo.Text) <> '' Then
      EdModulo.Text := DMOracle.BuscaNome('SELECT TB_MODULO.NOME_MODULO FROM TB_MODULO', 'COD_MODULO = ' + Trim(MEModulo.Text) )
    Else
      EdModulo.Text := 'Todos';
end;

procedure TFUsuarioFilialCons.MEUsuarioChange(Sender: TObject);
begin
  inherited;
  With DMUsuario do
    If Trim(MEUsuario.Text) <> '' Then
      EDUsuario.Text := DMOracle.BuscaNome('SELECT TB_USUARIO.NOME FROM TB_USUARIO','COD_USUARIO = '+Trim(MEUsuario.Text))
    Else
      EDUsuario.Text := 'Todos';
end;

procedure TFUsuarioFilialCons.MEFilialChange(Sender: TObject);
begin
  inherited;
  With DMUsuario do
    If Trim(MEFilial.Text) <> '' Then
      EdFilial.Text := DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(MEFilial.Text) )
    Else
      EdFilial.Text := 'Todos';
end;

end.
