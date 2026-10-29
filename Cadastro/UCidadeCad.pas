unit UCidadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList, DBPanel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFCidadeCad = class(TFTCadSimples)
    Cidades1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    ActionList1: TActionList;
    Action1: TAction;
    DBPanel19: TDBPanel;
    DBPnIBSMun: TDBPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCidadeCad: TFCidadeCad;

implementation

uses UCidade_cl, UCidadeCons, UEstadoCons, UEstado_cl, URCidade_Cidade,
  UCadastroParam, UPracaCons, UPraca_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFCidadeCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMCidade.QCidade.Close;
  DMCidade.QCidadeCons.Close;
  DMEstado.QEstadoCons.Close;
  Action:= CaFree;
  FCidadeCad:= Nil;
end;

procedure TFCidadeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil then
    FCidadeCons:= TFCidadeCons.Create(Application);
  If FCidadeCons.Showmodal = mrOk then
  With DMCidade do
  Begin
    QCidade.Close;
    QCidade.SetVariable('PK', QCidadeConsCod_Cidade.Value);
    QCidade.Open;
  End;

end;

procedure TFCidadeCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCidade.QCidade.Open;
end;

procedure TFCidadeCad.Cidades1Click(Sender: TObject);
var
  wNumLinhaOrder : Integer;
begin
  inherited;
  If(FCadastroParam = nil)Then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[16].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    With DMCidade do
    Begin
      QRCidade.Close;
      //Frames-----------------------------------
      If Trim(FCadastroParam.FmEstado17.MeEstado.Text) <> '' Then
        QRCidade.SetVariable('COD_ESTADO', Trim(FCadastroParam.FmEstado17.MeEstado.Text))
      Else
        QRCidade.SetVariable('COD_ESTADO', null);
      //------------------------------------------

      Case FCadastroParam.Cb16Ordem.ItemIndex of
        0 : QrCidade.SQL.Add('ORDER BY DESC_CIDADE');
        1 : QrCidade.SQL.Add('ORDER BY COD_ESTADO');
        2 : QrCidade.SQL.Add('ORDER BY COD_CIDADE');
        else
          raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      QRCidade.Open;
      If FRCidade_Cidade = Nil then
        FRCidade_Cidade := TFRCidade_Cidade.Create(Application);
        
      FRCidade_Cidade.QRPrimario.Preview;
      DMCidade.QRCidade.Close;
      wNumLinhaOrder := QrCidade.SQL.Count-1;
      QrCidade.SQL[wNumLinhaOrder] := '';
    End;
end;

procedure TFCidadeCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(50);

end;

procedure TFCidadeCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.dataset := DMCidade.QCidade;
end;

procedure TFCidadeCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFCidadeCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPracaCons;
  Classe := TFPracaCons;
end;

procedure TFCidadeCad.Action1Execute(Sender: TObject);
begin
  inherited;
  //if FImpressoraFiscal = Nil then
//    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
//  FImpressoraFiscal.ShowModal;
end;

end.
