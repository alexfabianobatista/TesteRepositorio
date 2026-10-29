unit UProducaoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, ActnList;

type
  TFProducaoCad = class(TFTCadSimples)
    SBMarcacao: TSpeedButton;
    SBForno: TSpeedButton;
    SBEmbarque: TSpeedButton;
    SBUsinagem: TSpeedButton;
    SBCorte: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SBCorteClick(Sender: TObject);
    procedure SBUsinagemClick(Sender: TObject);
    procedure SBMarcacaoClick(Sender: TObject);
    procedure SBFornoClick(Sender: TObject);
    procedure SBEmbarqueClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoCad: TFProducaoCad;

implementation

uses UProducaoCorte, UTela_cl, UProducaoUsinagem, UProducaoMarcacao,
  UProducaoForno, UBaixaEstoqueLeitor, UProducaoReposicao;

{$R *.dfm}

procedure TFProducaoCad.SBCorteClick(Sender: TObject);
begin
  inherited;
  If FProducaoCorte = Nil then
    FProducaoCorte := TFProducaoCorte.Create(Application);   
  FProducaoCorte.ShowModal;
end;

procedure TFProducaoCad.SBUsinagemClick(Sender: TObject);
begin
  inherited;
  If FProducaoUsinagem = Nil then
    FProducaoUsinagem := TFProducaoUsinagem.Create(Application);
  FProducaoUsinagem.ShowModal;
end;

procedure TFProducaoCad.SBMarcacaoClick(Sender: TObject);
begin
  inherited;
  If FProducaoMarcacao = Nil then
    FProducaoMarcacao := TFProducaoMarcacao.Create(Application);
  FProducaoMarcacao.ShowModal;
end;

procedure TFProducaoCad.SBFornoClick(Sender: TObject);
begin
  inherited;
  If FProducaoForno = Nil then
    FProducaoForno := TFProducaoForno.Create(Application);
  FProducaoForno.ShowModal;
end;

procedure TFProducaoCad.SBEmbarqueClick(Sender: TObject);
begin
  inherited;
  If FBaixaEstoqueLeitor = Nil then
    FBaixaEstoqueLeitor := TFBaixaEstoqueLeitor.Create(Application);
  FBaixaEstoqueLeitor.ShowModal;
end;

procedure TFProducaoCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FProducaoReposicao = Nil then
    FProducaoReposicao := TFProducaoReposicao.Create(Application);
  FProducaoReposicao.ShowModal;
end;

end.
