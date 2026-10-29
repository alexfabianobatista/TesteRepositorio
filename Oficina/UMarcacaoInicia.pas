unit UMarcacaoInicia;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, Db, variants;

type
  TFIniciaMarcacao = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    DSPrimario: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SBOSCons: TSpeedButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SBMecanicoCons: TSpeedButton;
    DBEdit20: TDBEdit;
    Label7: TLabel;
    EdNomeCadastro: TEdit;
    DBGrid1: TDBGrid;
    DSConsulta: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure SBOSConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIniciaMarcacao: TFIniciaMarcacao;

implementation

uses UOficina_cl, UOSCons, UOracle_cl, UOs_cl;

{$R *.DFM}

procedure TFIniciaMarcacao.FormCreate(Sender: TObject);
begin
  with DMOficina do
  begin
    QOSMarcacao.Close;
    QOSMarcacao.Open;
    QOSMarcacaoCons.Close;
    QOSMarcacaoCons.SetVariable('NUM_OS',Null);
    QOSMarcacaoCons.SetVariable('COD_MECANICO',Null);
    QOSMarcacaoCons.SetVariable('IND_SITUACAO','A');
    QOSMarcacaoCons.Open;
  end;
end;

procedure TFIniciaMarcacao.SBOSConsClick(Sender: TObject);
begin
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
  with DMOficina do
  begin
    if DMOs.QOSConsIND_SITUACAO.Value = 'F' then
       raise exception.Create('OS já foi fechada!')
    else
    begin
      QOSMarcacaoCons.Close;
      QOSMarcacaoCons.SetVariable('NUM_OS',DMOs.QOSConsNUM_OS.Value);
      QOSMarcacaoCons.SetVariable('COD_MECANICO',Null);
      QOSMarcacaoCons.SetVariable('IND_SITUACAO','A');
      QOSMarcacaoCons.Open;
      if QOSMarcacaoCons.RecordCount > 0 then
         raise exception.Create('Mecanico já encontra-se marcado para está O.S.');
      DBEdit3.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
      EdNomeCadastro.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMOs.QOSConsCOD_CADASTRO.Value));
    end;
    DMOs.QOSCons.Close;
  end;
end;

end.
