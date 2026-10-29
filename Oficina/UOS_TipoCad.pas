unit UOS_TipoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBPanel, ActnList;

type
  TFOFI0007 = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBPComissao: TDBPanel;
    DBPComissaoPeca: TDBPanel;
    DBPanel2: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPComissaoDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    function DBPComissaoRenderizar(Sender: TObject): Boolean;
    function DBPanel2Renderizar(Sender: TObject): Boolean;
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0007: TFOFI0007;

implementation

uses UOficina_cl, UOS_TipoCons, UROS_Tipo, UComissao_cl, UComissaoCons,
  UParamSistema_cl;

{$R *.DFM}

procedure TFOFI0007.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOFI0008 = nil then
     FOFI0008:= TFOFI0008.Create(Application);
  if FOFI0008.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QOS_TipoCad.Close;
      QOS_TipoCad.SetVariable('PK',QOS_TipoConsCOD_OS_TIPO.Value);
      QOS_TipoCad.Open;
    end;
  end;
end;

procedure TFOFI0007.FormActivate(Sender: TObject);
begin
  inherited;
  DMOficina.QOS_TipoCad.Close;
  DMOficina.QOS_TipoCad.open
end;

procedure TFOFI0007.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMOficina.QOS_TipoCad.Close;
  Action := CaFree;
  FOFI0007 := Nil;
end;

procedure TFOFI0007.DBPComissaoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FComissaoCons = nil then
    FComissaoCons := TFComissaoCons.Create(Application);
  FormConsulta := FComissaoCons;                                     
  QueryConsulta := DMComissao.QComissaoCons;
end;

function TFOFI0007.DBPComissaoRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
end;

function TFOFI0007.DBPanel2Renderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS';
end;

procedure TFOFI0007.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  DBPComissao.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  DBPComissaoPeca.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
end;

end.
